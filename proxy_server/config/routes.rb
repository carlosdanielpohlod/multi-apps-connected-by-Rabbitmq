Rails.application.routes.draw do
  resource :purchases, only: %i[create], controller: 'purchases'
  resource :products, only: %i[create], controller: 'products'
end
