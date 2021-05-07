Rails.application.routes.draw do
  #get 'users/index'
  resources :news
  resources :users, only: [:new, :create]
end
