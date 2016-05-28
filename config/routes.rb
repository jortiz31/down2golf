Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get "/login", :to => "users/sessions#new", :as => :login
    get "/signup", :to => "users/registrations#new", :as => :signup
    get "/logout", :to => "users/sessions#destroy", :as => :logout
    get '*path', to: 'users/sessions#new'
  end
  root 'site#angular'
  resources :users
  resources :matches
  resources :courses
end
