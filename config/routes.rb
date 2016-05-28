Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/sign_in', to: 'users/sessions#new'
    get "/login", :to => "users/sessions#new", :as => :login
    get "/signup", :to => "users/registrations#new", :as => :signup
    get "/logout", :to => "users/sessions#destroy", :as => :logout

  end
  root 'site#angular'
  get '*path', to: 'site#angular'

  resources :users
  scope '/api', defaults: {format: :json} do
    resources :matches
    resources :courses
  end

end
