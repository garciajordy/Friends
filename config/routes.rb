Rails.application.routes.draw do
  root "tweets#index"
  devise_for :users
 resources :users, only: [:show, :index] do
  resources :tweets, only: [:create, :destroy]
 end
 resources :tweets do
  resources :likes, only: [:create, :destroy]
 end

get "users/:id/follow", to: "users#follow"
get "users/:id/followed", to: "users#followed"
  resources :followings, only: [:create, :destroy] 
  
  resources :tweets, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
