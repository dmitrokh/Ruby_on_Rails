Rails.application.routes.draw do
  root "main#index"
  #get 'home', to: 'pages#home'
  #get 'city', to: 'main#index'
  #post 'users/sign_up', to: 'users#sign_up'
  
  get 'main/index', to: 'main#callForm'
  post 'main/index', to: 'main#index'
  post 'main/create', to: 'cities#create'
  
  get 'cities/view', to: 'cities#view'
  get 'cities/new', to: 'cities#new'
  get 'cities/create', to: 'cities#create'
  post 'cities/create', to: 'cities#create'
  get 'cities/update', to: 'cities#callUpdateForm'
  post 'cities/update', to: 'cities#update'
end
