Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'about', to: 'pages#about'
  root 'pages#home'
  resources :articles
  resources :users, except: [:new]
  get 'signup', to: 'users#new'


end
