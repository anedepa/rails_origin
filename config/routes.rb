Rails.application.routes.draw do
  # get 'sessions/new'
  get    '/login',   to: 'sessions#new'
   post   '/login',   to: 'sessions#create'
   delete '/logout',  to: 'sessions#destroy'


# resources :articles

# post '/articles/:id',to: 'coments#create'
resources :users
root 'articles#index'

get '/:per', to:'articles#index_per'


get  '/users',  to: 'users#new'
  post '/users',  to: 'users#create'
  post '/users/new',  to: 'users#create'


resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  # resources :coments,          only: [:create, :destroy]

resources :articles do
  resources :comments
  # resources :coments,only: [:create, :destroy]
end
  # delete'/articles/:id',to: 'coment#destroy'

end
