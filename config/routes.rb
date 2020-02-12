Rails.application.routes.draw do
  devise_for :accounts
  get "users/new"
  root "static_pages#home"
   as :accounts do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get "signup" => "devise/registrations#new"

  end
  # get "/donetours", to: "static_pages#donetours"
  # get "/help", to: "static_pages#help"
  # delete "/logout",to: "sessions#destroy"
  # get "/search", to: "tours#search"
  # post "/search", to: "tours#search"
  # get "auth/facebook", as: "auth_provider"
  # get "auth/facebook/callback", to: "users#login"
  resources :sessions
  resources :tours
  resources :user_bookings
  resources :bookings
  resources :categories
  resources :user_reviews
  resources :reviews
  resources :likes
  resources :rattings
  resources :accounts
  resources :revenue
  resources :user_comments
  mount Sidekiq::Web, at: "/sidekiq"
end
