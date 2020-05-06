Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #post "todos/create", to: "todos#create"
  get "/" => "home#index"
  post "users/login", to: "users#login"
  resources :todos
  resources :users
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
