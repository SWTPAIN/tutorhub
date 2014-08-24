Rails.application.routes.draw do
  root 'pages#index'

  resources :users, only: [:create]
  resources :tutors, only: [:index]
  get '/featured_tutors', to: "tutors#featured_tutors"
  resources :sessions, only: [:create, :destroy]
end
