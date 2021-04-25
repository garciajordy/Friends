Rails.application.routes.draw do
  root "tweets#index"
  devise_for :users
 resources :users, only: [:show, :index] do
  resources :tweets, only: [:create]
 end

  resources :followings, only: [:create, :destroy] 
  
  resources :tweets, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
