Rails.application.routes.draw do
  get "accounts/new"
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/signup", to: "accounts#new"
    post "/signup",  to: "accounts#create"
    resources :accounts
  end
end
