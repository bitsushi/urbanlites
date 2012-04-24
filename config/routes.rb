Urbanlites::Application.routes.draw do
  resources :sessions
  resources :users

  get 'activity' => 'activity#index'
  get 'contact' => 'pages#contact'
  get 'our-ethos' => 'pages#our_ethos', :as => 'our_ethos'

  # users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'admin' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  namespace :admin do
    resources :projects do
      collection do
        post :update_frontpage_items
      end
    end
    resources :photos
    resources :services, only: [:index, :edit, :update]
    resources :downloads
    resources :ethoses
    resources :posts
  end

  resources :downloads, only: [:index, :show]
  resources :projects, only: [:index, :show]
  resources :services, only: [:index, :show]

  root to: 'pages#home'

end
