Rails.application.routes.draw do
  root 'pages#index'

  resources :users, only: [:create]
  resources :tutors, only: [:index]
  resources :sessions, only: [:create, :destroy]
end
