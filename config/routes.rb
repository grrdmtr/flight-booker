Rails.application.routes.draw do
  resources :flights, only: %i[index]
  resources :bookings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "flights#index"
end
