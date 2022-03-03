Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences, only: [:show, :new, :create, :index] do
    resources :experience_users, only: [:create]
  end
  resources :experience_users, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
