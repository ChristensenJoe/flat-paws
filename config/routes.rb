Rails.application.routes.draw do
  resources :pets, only: [:index, :show]
  resources :shelters, only: [:index, :show]
end
