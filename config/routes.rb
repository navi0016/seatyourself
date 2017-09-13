Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :restaurants do
    resource :reservations
  end
  root 'restaurant#index'
end
