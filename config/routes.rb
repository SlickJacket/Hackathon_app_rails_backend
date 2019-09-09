Rails.application.routes.draw do
  resources :articles
  resources :subscribers
  resources :user_skills
  resources :skills
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
