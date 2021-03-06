Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'about', to: 'pages#about'
  root 'pages#home'
  resources :articles do
    resources :comments, only: [:create]
  end

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]

  mount ActionCable.server => '/cable'


end
