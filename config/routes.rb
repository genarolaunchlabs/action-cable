Rails.application.routes.draw do
  root 'messages#index'
  resources :users
  resources :messages do
  	collection {
  		get :typing
  	}
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :posts do
  	resources :comments, only: [:create, :destroy]
  end

  mount ActionCable.server, at: '/cable'
end
