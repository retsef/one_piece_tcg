module Request::Variant
  extend ActiveSupport::Concern

  included do
    before_action :detect_device_format

    %i[electron native phone tablet].each do |variant|
      define_method(:"request_#{variant}?") do
        device_format == variant
      end

      helper_method(:"request_#{variant}?")
    end

    private

      def detect_device_format
        request.variant = device_format
      end

      def device_format
        @device_format ||= case request.user_agent
                           when /Electron/i then :electron
                           when /Turbo Native|Strada/i then :native
                           when /iPhone|Android.*mobile|Windows Phone/i then :phone
                           when /iPad|Android/i then :tablet
                           end
      end
  end
end
