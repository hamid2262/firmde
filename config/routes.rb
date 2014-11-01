Rails.application.routes.draw do
  resources :kundens

  devise_for :users
  resources :blocks
  resources :pages
  
  get "admin", to:'backends#dashboard', as: "admin"
  get "admin/loesungen", to:'backends#loesungen', as: "admin_loesungen"
  

  get 'home/index'

  root 'home#index'
end