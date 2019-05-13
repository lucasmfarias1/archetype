Rails.application.routes.draw do
  get 'cpanel/index'
  get 'cpanel/heroes'
  get 'cpanel/users'
  devise_for :users

  root to: 'heroes#index'

  resources :heroes
end
