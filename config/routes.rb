Urbanlites::Application.routes.draw do
  get 'pages/contact', as: 'contact'
  root to: 'pages#home'
end
