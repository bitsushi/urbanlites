Urbanlites::Application.routes.draw do
  resources :sessions
  resources :users

  get 'activity' => 'activity#index'
  get 'contact' => 'pages#contact'
  get 'our-ethos' => 'pages#our_ethos', :as => 'our_ethos'

  # users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  namespace :admin do
    resources :projects
  end

  resources :downloads
  resources :photos, :only => [:index, :create, :destroy]
  resources :projects
  resources :services

  root to: 'pages#home'

end
