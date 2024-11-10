class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject

  default from: 'noreply@onepiecetcg.it'

  after_deliver :set_password_reset_send_at, only: :password_reset

  def password_reset(user)
    @user = user
    @url = edit_password_reset_url(@user.password_reset_token)

    mail(to: user.email)
  end

  private

    def set_password_reset_send_at
      @user.update(password_reset_sent_at: Time.current)
    end
end
