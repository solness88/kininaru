Rails.application.routes.draw do
  get 'users/index'
  resources :news
end
