return unless Rails.env.development? && false

require 'i18n'

class I18nDebug
  @on_lookup = lambda do |key, result|
    Rails.logger.tagged('i18n') { Rails.logger.debug("#{key} => #{result.inspect}") }
  end

  class << self
    attr_writer :on_lookup

    def on_lookup(&blk)
      return @on_lookup unless block_given?
      self.on_lookup = blk
    end
  end

  module Hook
    protected

      def lookup(*args)
        super.tap do |result|
          options = args.last.is_a?(Hash) ? args.pop : {}
          separator = options[:separator] || I18n.default_separator
          key = I18n.normalize_keys(*args, separator).join(separator)
          I18nDebug.on_lookup[key, result]
        end
      end
  end
end

I18n::Backend::Simple.prepend(I18nDebug::Hook)
# Rails.application.config.i18n.on_lookup = I18nDebug.on_lookup
