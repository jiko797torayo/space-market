Rails.application.routes.draw do
  devise_for :hosts
  devise_for :users
  root 'spaces#index'
  resources :spaces
  resources :equipment_infos
  resources :basic_infos
  resources :descriptions
  resources :images
  resources :plans
end
