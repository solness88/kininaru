Rails.application.routes.draw do
  #get 'sessions/new'
  #get 'users/index'
  resources :news
  resources :users, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
  end
end
