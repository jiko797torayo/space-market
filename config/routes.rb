Rails.application.routes.draw do
<<<<<<< HEAD
  root 'tests#index'
  get 'tests/createone' => 'tests#createone'
  get 'tests/createtwo' => 'tests#createtwo'
  get 'tests/createthree' => 'tests#createthree'
  get 'tests/createfour' => 'tests#createfour'
  get 'tests/createfive' => 'tests#createfive'
=======
  devise_for :hosts
  devise_for :users
  root 'spaces#index'
>>>>>>> master
end
