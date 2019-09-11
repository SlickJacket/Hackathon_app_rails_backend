Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles
      resources :subscribers
      resources :user_skills
      resources :skills
      resources :users
      post '/login', to: 'auth#create'
      post '/signup', to: 'users#create'
      get '/profile', to: 'users#profile'
      
    end
  end
end


# {
# 	"user": {
# 		"name": "Bobby Brown",
# 		"email": "buffaloboy655@gmail.com",
# 		"location": "New York, NY",
# 		"password": "buffalo"
# 	}
# }

# "jwt": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMn0.7wr2Y861Yz2G8Pv_rJlaZ4pT_sABDxJ6nXR0iOU4JhU"