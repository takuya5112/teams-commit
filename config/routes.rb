Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :posts, only: [:index, :create, :new, :show, :destroy] do
      resources :comments, only: :create 
      resources :likes, only: [:create, :destroy]
    end
  end
end
