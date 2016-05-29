Rails.application.routes.draw do
  root 'courses#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/sign_in', to: 'users/sessions#new'
    get "/login", :to => "users/sessions#new", :as => :login
    get "/signup", :to => "users/registrations#new", :as => :signup
    get "/logout", :to => "users/sessions#destroy", :as => :logout
  end
  resources :matches do
    resources :users do
      get 'join'
      get 'leave'
    end
  end
  resources :courses
  resources :users
  get '*path', to: 'courses#index'
end
