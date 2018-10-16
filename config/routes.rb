Rails.application.routes.draw do
  # devise_for :hosts
  devise_for :users, only:[:all],
                               controllers: {
                                  registrations: 'users/registrations',
                                  sessions:      'users/sessions'
                                }
  root 'spaces#index'
  as :user do
    get 'i/login', to: 'users/sessions#new', as: :new_user_session
    post 'i/login', to: 'users/sessions#create', as: :user_session
    delete 'i/logout', to: 'users/sessions#destroy', as: :destroy_user_session
    get 'i/sign_up', to: 'users/registrations#new', as: :new_user_registration
    post 'i/sign_up', to: 'users/registrations#create', as: :user_registration
  end
end
