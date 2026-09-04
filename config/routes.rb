Rails.application.routes.draw do
  resources :customers
  get "shop/index"
  get "shop/show"
  get "shop/create"
  get "shop/edit"
  get "shop/new"
  get "shop/destroy"
  get "home/index"
  supabase_authentication_routes
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  get  "login",  to: "sessions#new"
  post "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  root "home#index"
end
