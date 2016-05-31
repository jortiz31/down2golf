Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
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
  resources :conversations, only: [:index, :show, :destroy]
  resources :matches do
    resources :users do
      get 'join'
      get 'leave'
    end
  end
  resources :courses do
    resources :matches
  end
  resources :users do
    resources :matches
  end
  get "/courses/:course_id", to: "courses#show", as: "course_show"
  get "/matches/:match_id", to: "matches#show", as: "match_show"
  get '*path', to: 'courses#index'
end
