Rails.application.routes.draw do
  root 'pages#index'

  resources :tutors, only: [:index, :create]
end
