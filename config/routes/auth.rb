Rails.application.routes.draw do
  with_options controller: 'user_sessions' do
    get 'login', action: :new, as: :login
    post 'login', action: :create
    post 'logout', action: :destroy, as: :logout
  end

  with_options controller: 'user_password_resets' do
    resources :password_resets, only: %i[new create edit update]
  end
end
