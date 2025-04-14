Rails.application.routes.draw do
  root 'top_pages#index'
  get 'top_pages/help'
  get '/top_page',   to: 'top_pages#index'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'user_sessions#new'
  get   '/login',   to: 'user_sessions#create'
  delete '/logout',  to: 'user_sessions#destroy'
  resources :users, only: [:new, :create]
end
