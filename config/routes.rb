Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'courses#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'registrations'
  }
  devise_scope :user do
    get '/sign_in', to: 'users/sessions#new'
    get "/login", :to => "users/sessions#new", :as => :login
    get "/signup", :to => "users/registrations#new", :as => :signup
    get "/logout", :to => "users/sessions#destroy", :as => :logout
  end
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end
  resources :messages, only: [:new, :create]
  resources :matches do
    resources :comments
    resources :users do
      get 'join'
      get 'leave'
    end
  end
  resources :courses do
    resources :matches do
      resources :comments
    end
    resources :comments
  end
  resources :users do
    resources :matches
  end
  get '*path', to: 'courses#index'
end
