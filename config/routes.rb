Rails.application.routes.draw do
  get 'site/angular'

  root 'site#angular'

  scope '/api', defaults: { format: :json } do

    resources :courses, except: [:new, :edit] do
      resources :matches, except: [:new, :edit]
    end
  end

  get '*path', to: 'site#angular'
end
