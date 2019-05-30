Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'

  resources :books, only: :show do
    resources :reviews, only: :create
  end
end
