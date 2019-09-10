Rails.application.routes.draw do
  resources :articles
  resources :subscribers
  resources :user_skills
  resources :skills
  resources :users
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
