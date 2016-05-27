Rails.application.routes.draw do
  root 'site#angular'

  get '*path', to: 'site#angular'
end
