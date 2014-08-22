Rails.application.routes.draw do
  root 'pages#index'

  resources :tutors, only: [:index, :create]
  resources :sessions, only: [:create, :destroy]
end
