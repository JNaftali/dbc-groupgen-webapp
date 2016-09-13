Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'pages#login'
  root 'pages#login'
  post '/login' => 'pages#new_session'
  get '/logout' => 'pages#logout'
  resources :users
  resources :cohorts do
    resources :batches, only: [:create, :show]
    resources :students, only: [:create]
  end
end
