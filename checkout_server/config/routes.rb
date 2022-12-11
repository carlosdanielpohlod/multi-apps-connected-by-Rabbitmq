Rails.application.routes.draw do
  resources :products, only: [:create]
end
