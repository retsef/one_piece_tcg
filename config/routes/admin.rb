Rails.application.routes.draw do
  namespace :admin do
    resources :cards, only: %i[index show]

    resources :decks
  end
end
