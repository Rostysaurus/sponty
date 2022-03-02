Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
  resources :experiences, only: [:new]
=======
  resources :experiences, only: [:show]
>>>>>>> c60ca3bc67f0f4c0cf146df66fcde6ed41f0e9bc
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
