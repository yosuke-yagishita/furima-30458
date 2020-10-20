Rails.application.routes.draw do
  get 'buyer_infos/index'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :purchases, only: [:new, :create]
end