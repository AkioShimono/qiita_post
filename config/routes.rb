Rails.application.routes.draw do
  root to:"posts#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/sync', to: 'syncs#sync'
  put '/sync', to: 'syncs#post_sync'
  resources :users do
    resources :contents
  end
end
