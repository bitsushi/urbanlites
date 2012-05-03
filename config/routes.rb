Urbanlites::Application.routes.draw do
  resources :sessions
  resources :users

  get 'activity' => 'activity#index'
  get 'contact' => 'pages#contact'
  get 'our-ethos' => 'pages#our_ethos', :as => 'our_ethos'

  # users
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  # get 'admin' => 'Admin:ProjectsController#index'
  get 'logout' => 'sessions#destroy'

  namespace :admin do
    root to: 'projects#index'
    resources :projects do
      collection do
        post :sort
        post :sort_videos
        post :update_frontpage_items
      end
    end
    resources :frontpage
    resources :photos do collection { post :sort } end
    resources :services do collection { post :sort } end
    resources :downloads do collection { post :sort } end
    resources :ethoses do collection { post :sort } end
    resources :posts
  end

  resources :downloads, only: [:index, :show]
  resources :projects, only: [:index, :show]
  resources :services, only: [:index, :show]

  root to: 'pages#home'

end
