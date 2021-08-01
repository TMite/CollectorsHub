Rails.application.routes.draw do
  root "main#index"
  resources :main
  resources :posts
end
