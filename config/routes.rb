Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :locations, only: [:new, :create]
  get 'users/:username', to: 'users#show', as: :user
end
