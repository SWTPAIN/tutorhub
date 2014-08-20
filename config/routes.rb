Rails.application.routes.draw do
  root 'pages#index'

  resources :sessions
  resources :tutors, only: [:index, :create]
end
