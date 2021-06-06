Rails.application.routes.draw do
  root to: 'articles#home'
  post '/sessions/adminguest', to: 'sessions#adminguest'
  post '/sessions/guest', to: 'sessions#guest'
  resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]

  resources :articles do
    resources :comments
  end

  namespace :admin do
    resources :users
  end
end
