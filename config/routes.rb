Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "games#new"
  get "new", to: "games#new"
  post "score", to: "games#score"
  post '/reset_score', to: 'games#reset', as: 'reset_score'

end
