Rails.application.routes.draw do
  devise_for :users

  root to: 'products#index'

  resources :products, only: [:new, :create, :show, :index , :destroy ]  do
    resources :orders, only: [:create]
  end

end
