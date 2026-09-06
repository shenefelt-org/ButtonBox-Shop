Rails.application.routes.draw do
  # **** RESOURCES ROUTES ****
  resources :customers
  resources :shop
  resources :quotes
  resources :admin_consoles, path: "admin", controller: "admin_consoles"
  resources :products
  
  # about me 
  get "/riley", to: "home#index"

  supabase_authentication_routes
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  get  "login",  to: "sessions#new", as: :login
  post "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  root "home#index"
end
