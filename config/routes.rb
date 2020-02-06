Rails.application.routes.draw do
  
  get    '/login',   to: 'sessions#new'
   post   '/login',   to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'

resources :users
#root 'articles#index'
root 'top_page#index'
resources :account_activations, only: [:edit]
resources :password_resets,     only: [:new, :create, :edit, :update]
  
resources :articles do
  resources :comments, only:[:create, :destroy]
end

 
#get '/:per', to:'articles#index_per'
post '/', to: 'top_page#new'
#post '/user/:id', to: 'article#new'
end
