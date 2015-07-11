Rails.application.routes.draw do
  resource  :session
  resources :examples

  root 'examples#index'
end
