Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'

  resources :books, only: :show do
    resources :reviews, only: :create
    resources :favorites, only: :create
  end

  resources :favorites, only: :destroy
end
