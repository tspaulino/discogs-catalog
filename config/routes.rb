Rails.application.routes.draw do
  get 'albuns/index'
  get 'home/index'
  get '/search' => "albums#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
