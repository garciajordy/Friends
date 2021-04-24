Rails.application.routes.draw do
  root "tweets#index"
  devise_for :users
 resources :users, only: [:show]
  resources :tweets, only: [:create]
  resources :followings, only: [:create, :destroy] 
  
  resources :tweets, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
