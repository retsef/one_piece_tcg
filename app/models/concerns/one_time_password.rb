# frozen_string_literal: true

module OneTimePassword # rubocop:disable Metrics/ModuleLength
  extend ActiveSupport::Concern

  class_methods do
    def authenticates_with_otp!(options = {})
      cattr_accessor :otp_column_name, :otp_counter_column_name,
                     :otp_backup_codes_column_name, :otp_after_column_name
      class_attribute :otp_digits, :otp_counter_based,
                      :otp_backup_codes_count, :otp_one_time_backup_codes,
                      :otp_interval

      self.otp_column_name = options.fetch(:column_name, 'otp_secret_key').to_s
      self.otp_digits = options.fetch(:length, 6)
      self.otp_counter_based = options.fetch(:counter_based, false)
      self.otp_counter_column_name = options.fetch(:counter_column_name, 'otp_counter').to_s
      self.otp_interval = options[:interval]
      self.otp_after_column_name = options[:after_column_name]
      self.otp_backup_codes_column_name = options.fetch(:backup_codes_column_name, 'otp_backup_codes').to_s
      self.otp_backup_codes_count = options.fetch(:backup_codes_count, 12)
      self.otp_one_time_backup_codes = options.fetch(:one_time_backup_codes, false)

      before_create(**options.slice(:if, :unless)) do
        otp_regenerate_secret unless otp_column
        otp_regenerate_counter if otp_counter_based && !otp_counter
        otp_regenerate_backup_codes if backup_codes_enabled?
      end

      return unless respond_to?(:attributes_protected_by_default)

      define_singleton_method :attributes_protected_by_default do
        super + [ otp_column_name, otp_counter_column_name ]
      end
    end

    # Defaults to 160 bit long secret
    # (meaning a 32 character long base32 secret)
    def otp_random_secret(length = 20)
      ROTP::Base32.random(length)
    end
  end

  included do
    def otp_regenerate_secret
      self.otp_column = self.class.otp_random_secret
    end

    def otp_regenerate_counter
      self.otp_counter = 1
    end

    def authenticate_otp(code, options = {})
      return false if code.blank?
      return true if backup_codes_enabled? && authenticate_backup_code(code)

      if otp_counter_based
        otp_counter == authenticate_hotp(code, options)
      else
        authenticate_totp(code, options).present?
      end
    end

    def otp_code(options = {})
      if otp_counter_based
        hotp_code(options)
      else
        totp_code(options)
      end
    end

    def provisioning_uri(account = nil, options = {})
      account ||= email if respond_to?(:email)
      account ||= ''

      if otp_counter_based
        ROTP::HOTP
          .new(otp_column, options)
          .provisioning_uri(account, otp_counter)
      else
        ROTP::TOTP
          .new(otp_column, options)
          .provisioning_uri(account)
      end
    end

    def otp_column
      public_send(self.class.otp_column_name)
    end

    def otp_column=(attr)
      public_send(:"#{self.class.otp_column_name}=", attr)
    end

    def otp_counter
      if self.class.otp_counter_column_name == 'otp_counter'
        super
      else
        public_send(self.class.otp_counter_column_name)
      end
    end

    def otp_counter=(attr)
      if self.class.otp_counter_column_name == 'otp_counter'
        super
      else
        public_send(:"#{self.class.otp_counter_column_name}=", attr)
      end
    end

    def serializable_hash(options = nil)
      options ||= {}
      options[:except] = Array(options[:except])
      options[:except] << self.class.otp_column_name

      super
    end

    def otp_regenerate_backup_codes
      otp = ROTP::OTP.new(otp_column)
      backup_codes = Array.new(self.class.otp_backup_codes_count) do
        otp.generate_otp((SecureRandom.random_number(9e5) + 1e5).to_i)
      end

      public_send(:"#{self.class.otp_backup_codes_column_name}=", backup_codes)
    end

    def backup_codes_enabled?
      self.class.attribute_method?(self.class.otp_backup_codes_column_name)
    end

    private

      def authenticate_hotp(code, options = {})
        hotp = ROTP::HOTP.new(otp_column, digits: otp_digits)
        result = hotp.verify(code, otp_counter)
        if result && options[:auto_increment]
          self.otp_counter += 1
          save if respond_to?(:changed?) && !new_record?
        end
        result
      end

      def authenticate_totp(code, options = {})
        totp = ROTP::TOTP.new(
          otp_column,
          digits: otp_digits,
          interval: otp_interval
        )
        otp_after = public_send(otp_after_column_name) if otp_after_column_name_enabled?
        totp.verify(code, drift_behind: options[:drift] || 0, after: otp_after)
            .tap do |updated_last_otp_at|
          updated_last_otp_at && otp_after_column_name_enabled? &&
            update(otp_after_column_name => updated_last_otp_at)
        end
      end

      def otp_after_column_name_enabled?
        otp_after_column_name && respond_to?(otp_after_column_name)
      end

      def hotp_code(options = {})
        if options[:auto_increment]
          self.otp_counter += 1
          save if respond_to?(:changed?) && !new_record?
        end
        ROTP::HOTP.new(otp_column, digits: otp_digits).at(otp_counter)
      end

      def totp_code(options = {})
        time = if options.is_a?(Hash)
                 options.fetch(:time, Time.current)
        else
                 options
        end
        ROTP::TOTP.new(
          otp_column,
          digits: otp_digits,
          interval: otp_interval
        ).at(time)
      end

      def authenticate_backup_code(code)
        backup_codes_column_name = self.class.otp_backup_codes_column_name
        backup_codes = public_send(backup_codes_column_name)
        return false unless backup_codes.present? && backup_codes.include?(code)

        if self.class.otp_one_time_backup_codes
          backup_codes.delete(code)
          public_send(:"#{backup_codes_column_name}=", backup_codes)
          save if respond_to?(:changed?) && !new_record?
        end

        true
      end
  end
end
