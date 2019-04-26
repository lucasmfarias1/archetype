Rails.application.routes.draw do
  devise_for :users

  root to: 'heroes#index'

  resources :heroes
end
