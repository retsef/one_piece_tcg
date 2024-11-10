Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up', to: 'rails/health#show', as: :rails_health_check
  mount ActionCable.server, at: '/cable'

  draw :auth

  draw :admin
  draw :api

  # Defines the root path route ("/")
  root controller: 'admin/cards', action: :index

  get 'manifest', to: 'pwa#manifest', defaults: { format: 'json' }
  get 'service_worker', to: 'pwa#service_worker', defaults: { format: 'js' }

  with_options via: :all do
    match '/404', to: 'errors#not_found'
    match '/422', to: 'errors#unprocessable'
    match '/426', to: 'errors#upgrade_required'
    match '/500', to: 'errors#internal_server_error'
    match '/503', to: 'errors#service_unavailable'
  end

  resources :user_feedbacks, only: %i[new create]
  post '/crash_report', to: 'errors#crash_report'

  direct(:producer) { 'https://en.onepiece-cardgame.com' }

  if Rails.env.development?
    mount Lookbook::Engine, at: '/lookbook'
    mount MissionControl::Jobs::Engine, at: '/jobs'
    mount SolidErrors::Engine, at: '/errors'
  end
end
