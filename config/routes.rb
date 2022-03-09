Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "profile", to: "pages#profile"
  resources :experiences, only: [:show, :new, :create, :index, :destroy] do
    resources :chatrooms, only: [:show] do
      resources :messages, only: :create
    end
    resources :experience_users, only: [:create]
  end
  resources :experience_users, only: [:index, :destroy]
  resources :messages, only: [:destroy]
  end
