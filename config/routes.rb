Rails.application.routes.draw do
  root "questions#index"

  # The main job of the routes:
  # You map a request to a controller with no action
  get "/hello/" => "welcome#index"
  get "/about" => "welcome#about"

  # providing the :as option will give us a route helper method
  # it will override the default one if any.
  # please note that route helpers only loop at the 'path' portion of the route
  # and not the HTTP verb.
  # helper methods must be unique
  get "/hello/:name" => "welcome#greet", as: :greet

  get "/subscribe" => "subscribe#index"
  post "/subscribe" => "subscribe#create"


  resources :questions do
    resources :likes, only: [:create, :destroy]
    resources :answers, only: [:create, :destroy]
  end

  resources :users, only:[:create, :new, :index]

  resources :sessions, only:[:new, :create] do
    delete :destroy, on: :collection
  end

end
