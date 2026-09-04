Rails.application.routes.draw do
  get "home/index"
  supabase_authentication_routes
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  get  "login",  to: "sessions#new"
  post "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  root "home#index"
end
