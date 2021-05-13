Rails.application.routes.draw do

  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]

  resources :news do
    resources :comments
  end

  namespace :admin do
    resources :users
  end

end
