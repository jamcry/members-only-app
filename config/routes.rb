Rails.application.routes.draw do
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'
  get  'signup', to: 'users#new'
  resources :users
  resources :posts
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

end
