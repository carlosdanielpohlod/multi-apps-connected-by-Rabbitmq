Rails.application.routes.draw do
  resource :purchase, only: %i[create], controller: 'purchase'
end
