Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences, only: [:show, :new, :create, :index]

  resources :chatrooms, only: [:show] do
    resources :messages, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
