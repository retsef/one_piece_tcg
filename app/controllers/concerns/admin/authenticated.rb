module Admin::Authenticated
  extend ActiveSupport::Concern

  included do
    # Auth
    before_action :set_error_user_context

    authorize :user, through: :current_user

    def current_user
      resume_session if Current.user.nil?

      Current.user
    end
  end

  private

    def set_error_user_context
      Rails.error.set_context(user_id: Current.user&.id)
    end

    def not_authenticated
      redirect_to login_path, alert: t('auth.session.not_authenticated'), status: :see_other
    end
end
