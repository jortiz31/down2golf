Rails.application.routes.draw do
  root 'site#angular'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/sign_in', to: 'users/sessions#new'
    get "/login", :to => "users/sessions#new", :as => :login
    get "/signup", :to => "users/registrations#new", :as => :signup
    get "/logout", :to => "users/sessions#destroy", :as => :logout
  end
  scope '/api', defaults: {format: :json} do
    resources :matches
    resources :courses
  end
  put "/matches/:id", to:'matches#update', as: "matches_update"
  resources :matches
  resources :courses
  resources :users
  get '*path', to: 'site#angular'
end
