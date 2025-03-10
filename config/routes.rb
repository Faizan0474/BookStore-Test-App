Rails.application.routes.draw do
  root "home#index"

  resources :items
  resources :orders
  resources :notifications

  namespace :api do
    resources :items, only: [:index, :show]
    resources :orders, only: [:create, :show, :index]
    resources :notifications, only: [:index]
  end
end
