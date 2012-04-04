Urbanlites::Application.routes.draw do
  get "activity/index"

  resources :downloads
  match 'activity' => 'activity#index', as: 'activity'

  resources :photos, :only => [:index, :create, :destroy]
  resources :projects
  resources :services

  match 'contact' => 'pages#contact', as: 'contact'
  match 'our-ethos' => 'pages#our_ethos', as: 'our_ethos'

  root to: 'pages#home'
end
