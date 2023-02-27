Rails.application.routes.draw do
  resources :products, only: [:create]
  resources :purchases, only: [:create, :show]
end
