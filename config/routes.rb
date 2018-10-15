Rails.application.routes.draw do
  devise_for :hosts
  devise_for :users, controllers: {
      confirmations: 'users/confirmations',
      passwords:     'users/passwords',
      registrations: 'users/registrations',
      sessions:      'users/sessions',
  }
  root 'spaces#index'
  devise_scope :user do
    get 'i/login', to: 'users/sessions#new'
    get 'i/sign_up', to: 'users/registrations#new'
  end
end
