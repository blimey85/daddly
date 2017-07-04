Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  # resources :comments
  resources :events

  resources :user

  resources :votes

  get 'venues/search', controller: :venues
  resources :venues

  root to: 'visitors#index'
end
