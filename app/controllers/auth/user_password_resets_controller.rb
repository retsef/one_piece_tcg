class Auth::UserPasswordResetsController < Auth::BaseController
  allow_unauthenticated_access
  before_action :set_user_by_token, only: %i[ edit update ]

  def new; end

  # request password reset.
  # you get here when the user entered their email in the reset password form and submitted it.
  def create
    @user = User.find_by(email: params[:email])

    # This line sends an email to the user with instructions on how to reset their password (a url with a random token)
    if @user.present?
      @user.generate_password_reset_token!
      UserMailer.password_reset(@user).deliver_later
    end

    # Tell the user instructions have been sent whether or not email was found.
    # This is to not leak information to attackers about which emails exist in the system.
    redirect_to login_path, notice: t('.success')
  end

  def edit; end

  # This action fires when the user has sent the reset password form.
  def update
    # the next line makes the password confirmation validation work
    if @user.update(params.permit(:password, :password_confirmation))
      redirect_to login_path, notice: t('.success')
    else
      redirect_to edit_password_url(params[:token]), alert: 'Passwords did not match.'
    end
  end

  private
    def set_user_by_token
      @user = User.valid_password_reset_token.find_by!(password_reset_token: params[:token])
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to new_password_url, alert: 'Password reset link is invalid or has expired.'
    end
end
