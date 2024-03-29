Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :blogs
  
  namespace :blog do
    resources :feedback, only: %i[create]
  end
end
