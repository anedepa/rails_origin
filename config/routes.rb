Rails.application.routes.draw do
  
get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'

resources :users

root 'top_page#index'
resources :account_activations, only: [:edit]
resources :password_resets,     only: [:new, :create, :edit, :update]
resources :articles do
resources :comments, only:[:create, :destroy]
end

post '/', to: 'top_page#new'

end
