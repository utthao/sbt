Rails.application.routes.draw do
  get 'users/new'
  root "static_pages#home"
  get "/donetours", to: "static_pages#donetours"
  get "/help", to: "static_pages#help"
  delete "/logout",to: "sessions#destroy"
  resources :sessions
  resources :tours
  resources :user_bookings
  resources :bookings
  resources :categories
  resources :user_reviews
  resources :reviews
  resources :likes
  resources :accounts
end
