Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'restaurants/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "restaurants", to: "restaurants#index"
  get "restaurants/new", to: "restaurants#new", as: :new_restaurant
  get "restaurants/:id", to: "restaurants#show", as: :restaurant
  get "restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
  post "restaurants", to: "restaurants#create"
  get "restaurants/:restaurant_id/reviews/new", to: "reviews#new", as: :new_restaurant_review
  post "restaurants/:restaurant_id/reviews", to: "reviews#create", as: :restaurant_reviews



  # Defines the root path route ("/")
  # root "posts#index"
end
