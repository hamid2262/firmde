Rails.application.routes.draw do
  get 'home/index'

  resources :blocks
  resources :pages

  root 'home#index'
end