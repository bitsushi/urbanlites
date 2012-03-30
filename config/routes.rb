Urbanlites::Application.routes.draw do
  resources :downloads

  resources :projects
  resources :services

  match 'contact' => 'pages#contact', as: 'contact'
  match 'our-ethos' => 'pages#our_ethos', as: 'our_ethos'

  root to: 'pages#home'
end
