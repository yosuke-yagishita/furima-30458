Rails.application.routes.draw do
  get 'buyer_infos/index'
  devise_for :users
  root to: "items#index"
  resources :items, expect: :update do
    resources :purchases, only: [:index, :create]
  end
end
