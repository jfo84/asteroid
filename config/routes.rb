Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  resources :conversations, only: [:index, :create]
  resources :messages, only: [:index, :create]
end
