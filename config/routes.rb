Rails.application.routes.draw do
  devise_for :hosts
  devise_for :users
  root 'spaces#index'
end
