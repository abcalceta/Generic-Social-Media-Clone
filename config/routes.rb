Rails.application.routes.draw do
  root to: 'posts#index'

  devise_for :users
  resources :users, only: [:index, :show]

  get "search", to: "posts#search"


  resources :posts do
    resource :favorite, module: :posts
  end

  resources :about, only: [:index]

  resource :friendship, only: [:destroy, :create]
  # post "make_friends", to: "friendships#make_friends"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
