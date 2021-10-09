Rails.application.routes.draw do
  root "main#index"
  resources :main
  resources :posts do 
    collection do 
      get :change
    end
    resources :comments
  end
  resources :collections
  resources :profiles
  
  get "password", to:"passwords#edit", as: :edit_password
  patch "password", to:"passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "register", to: "register#new"
  post "register", to: "register#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"


end
