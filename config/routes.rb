Rails.application.routes.draw do
  root "main#index"
  resources :main
  resources :posts
  resources :collections
  
  get "register", to: "register#new"
  post "register", to: "register#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"


end
