module Admin::Authenticated
  extend ActiveSupport::Concern

  included do
    # Auth
    before_action :authenticate_admin
    before_action :set_sentry_user_context

    authorize :user, through: :current_user

    helper_method :current_user
    helper_method :logged_in?

    def authenticate_admin
      # TODO: Add authentication logic here.
      require_login
    end

    private

      def set_sentry_user_context
        Sentry.set_user(id: current_user&.id, email: current_user&.email)
      end

      def not_authenticated
        redirect_to login_path, alert: t('session.not_authenticated'), status: :see_other
      end
  end
end
