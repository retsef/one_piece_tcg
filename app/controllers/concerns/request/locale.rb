module Request::Locale
  extend ActiveSupport::Concern

  included do
    before_action :best_locale_from_request!

    private

      def best_locale_from_request!
        I18n.locale = best_locale_from_request
      end

      def best_locale_from_request
        locale ||= locale_from_params
        locale ||= locale_from_header

        # If the server cannot serve any matching language,
        # it can theoretically send back a 406 (Not Acceptable) error code.
        # But, for a better user experience, this is rarely done and more
        # common way is to ignore the Accept-Language header in this case.
        return I18n.default_locale if locale.nil?

        locale
      end

      def locale_from_header
        return nil unless request.headers.key?('HTTP_ACCEPT_LANGUAGE')

        string = request.headers.fetch('HTTP_ACCEPT_LANGUAGE')
        AcceptLanguage.parse(string).match(*I18n.available_locales)
      end

      def locale_from_params
        return nil unless request.params.key?('locale')

        string = request.params.fetch('locale')
        AcceptLanguage.parse(string).match(*I18n.available_locales)
      end
  end
end
