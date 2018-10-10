Rails.application.routes.draw do
  root 'tests#index'
  get 'tests/createone' => 'tests#createone'
  get 'tests/createtwo' => 'tests#createtwo'
  get 'tests/createthree' => 'tests#createthree'
  get 'tests/createfour' => 'tests#createfour'
  get 'tests/createfive' => 'tests#createfive'
end
