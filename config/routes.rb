Rails.application.routes.draw do


  resources :profiles
  resources :users
  root 'applications#index'

end
