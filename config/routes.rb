Rails.application.routes.draw do
  get 'users/new'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home" 
    get "/help", to: "static_pages#help"
  end
end
