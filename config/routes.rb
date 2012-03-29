Urbanlites::Application.routes.draw do
  resources :projects
  resources :services

  get 'pages/contact', as: 'contact'
  get 'pages/our_ethos', as: 'our_ethos'

  root to: 'pages#home'
end
