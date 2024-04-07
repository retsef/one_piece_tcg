class UserSessionsController < ApplicationController
  layout 'auth'

  before_action :unecessary_login, only: :new, if: :logged_in?
  before_action :require_login, only: :destroy

  default_form_builder Auth::FormBuilder

  def new; end

  def create
    @user = login(params[:email], params[:password], params[:remember])

    if @user
      redirect_back_or_to admin_root_path, notice: t('session.logged_in'), status: :see_other
    else
      flash.now[:alert] = t('session.invalid')
      render :new, status: :unauthorized
    end
  end

  def destroy
    logout

    redirect_to login_path, notice: t('session.logged_out'), status: :see_other
  end

  private

    def unecessary_login
      redirect_to root_path, status: :see_other
    end

    def redirect_back_or_to(url, **options)
      redirect_to(session[:return_to_url] || url, **options)
      session[:return_to_url] = nil
    end
end
