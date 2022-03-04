Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences, only: [:show, :new, :create, :index] do
    resources :chatrooms, only: [:show] do
      resources :messages, only: :create
    end
    resources :experience_users, only: [:create]
  end
  resources :experience_users, only: [:index, :destroy]
  end
