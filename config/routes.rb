Rails.application.routes.draw do
  devise_for :users
  resources :blocks
  resources :pages
  
  get "admin", to:'backends#index', as: "admin"
  get 'home/index'

  root 'home#index'
end