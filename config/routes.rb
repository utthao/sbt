Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/signup", to: "accounts#new"
    post "/signup", to: "accounts#create"
    get "/profile", to: "accounts#show"
    get "setting", to: "accounts#edit"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :accounts
  end
end

