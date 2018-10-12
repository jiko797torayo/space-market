Rails.application.routes.draw do
  devise_for :hosts
<<<<<<< HEAD
  devise_for :users, controllers: {
      confirmations: 'users/confirmations',
      passwords:     'users/passwords',
      registrations: 'users/registrations',
      sessions:      'users/sessions',
  }
  root 'tests#index'
  resources :user, only: [:index, :update, :edit]
=======
  devise_for :users
  root 'spaces#index'
>>>>>>> master
end
