Rails.application.routes.draw do
  get "users/new"
  root "static_pages#home"
  get "/donetours", to: "static_pages#donetours"
  get "/help", to: "static_pages#help"
  get "/search", to: "tours#search"
  post "/search", to: "tours#search"
  resources :sessions
  resources :tours
  resources :user_bookings
  resources :bookings
  resources :categories
  resources :user_reviews
  resources :reviews
  resources :likes
  resources :rattings
  resources :revenue
  resources :user_comments
  devise_scope :accounts do
    get "sessions/new" => "devise/sessions#new"
  end
  devise_for :accounts, :controllers => {:sessions => "sessions"}
  resources :accounts
  # mount Sidekiq::Web, at: "/sidekiq"
end
