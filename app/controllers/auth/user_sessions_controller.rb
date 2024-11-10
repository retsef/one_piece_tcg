class Auth::UserSessionsController < Auth::BaseController
  allow_unauthenticated_access only: %i[ new create ]
  before_action :unecessary_login, only: :new, if: :authenticated?

  rate_limit to: 10, within: 3.minutes, only: :create, with: :rate_limited

  def new; end

  def create
    @user = User.authenticate_by(params.permit(:email, :password))

    if @user
      start_new_session_for @user
      redirect_to after_authentication_url, notice: t('auth.session.logged_in'), status: :see_other
    else
      flash.now[:alert] = t('auth.session.invalid')
      render :new, status: :unauthorized
    end
  end

  def destroy
    terminate_session

    redirect_to login_path, notice: t('auth.session.logged_out'), status: :see_other
  end

  def rate_limited
    redirect_to login_path, alert: 'Try again later.', status: :too_many_requests
  end

  private

    def unecessary_login
      redirect_to root_path, status: :see_other
    end
end
