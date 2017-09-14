Rails.application.routes.draw do

  # setting routes for user session for only create, new, and destroy
  resource :sessions, only: [:create, :new, :destroy]

  resources :restaurants do
    resources :reservations
  end
  root 'restaurants#index'

  resources :users, only: [:new,:create]
end
