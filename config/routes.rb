Rails.application.routes.draw do
  devise_for :hosts
  devise_for :users
  root 'spaces#index'
  resources :equipments
  resources :basicinfos
  resources :descriptions
  resources :images
  resources :plans
end
