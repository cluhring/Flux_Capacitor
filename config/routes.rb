Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # get '/dashboard', to: 'dashboard#show'
  root 'welcome#index'
  resources :stations
  resources :welcome, only: [:index]
end
