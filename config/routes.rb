Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'user_authentications#index'

  resources :articles do
    resources :comments, only: [:index, :create, :destroy]
  end

  resource :profile, only: [:show, :edit, :update]
  
end
