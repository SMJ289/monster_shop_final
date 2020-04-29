Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get :root, to: 'welcome#index'

  # before
  # resources :merchants do
  #   resources :items, only: [:index]
  # end

  # after  
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id', to: 'merchants#show', as: 'merchant'
  get '/merchants/:id/edit', to: 'merchants#edit', as: 'edit_merchant'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'
  get '/merchants/:merchant_id/items', to: 'items#index'

  # before
  # resources :items, only: [:index, :show] do
  #   resources :reviews, only: [:new, :create]
  # end

  # after
  get '/items', to: 'items#index', as: 'items'
  get '/items/:id', to: 'items#show', as: 'item'
  get '/items/:item_id/reviews/new', to: 'reviews#new', as: 'new_item_review'
  post '/items/:item_id/', to: 'reviews#create', as: 'item_reviews'

  # before
  # resources :reviews, only: [:edit, :update, :destroy]
  
  # after
  get '/reviews/:id/edit', to: 'reviews#edit', as: 'edit_review'
  patch '/reviews/:id', to: 'reviews#update', as: 'review'
  delete '/reviews/:id', to: 'reviews#destroy'
  
  # these routes are too specific for resources
  get '/cart', to: 'cart#show'
  post '/cart/:item_id', to: 'cart#add_item'
  delete '/cart', to: 'cart#empty'
  patch '/cart/:change/:item_id', to: 'cart#update_quantity'
  delete '/cart/:item_id', to: 'cart#remove_item'


  get '/registration', to: 'users#new', as: :registration
  
  # before
  # resources :users, only: [:create, :update]
 
  # after
  post '/users', to: 'users#create', as: 'users'
  patch '/users/:id', to: 'users#update', as: 'user'


  patch '/user/:id', to: 'users#update'
  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'
  get '/profile/edit_password', to: 'users#edit_password'
  post '/orders', to: 'user/orders#create'
  get '/profile/orders', to: 'user/orders#index'
  get '/profile/orders/:id', to: 'user/orders#show'
  delete '/profile/orders/:id', to: 'user/orders#cancel'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  namespace :merchant do
    get '/', to: 'dashboard#index', as: :dashboard
    # before
    # resources :orders, only: :show
    # after
    get '/orders/:id', to: 'orders#show'
    # before
    # resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
    # after
    get '/items', to: 'items#index'
    get '/items/new', to: 'items#new'
    post '/items', to: 'items#create'
    get '/items/:id/edit', to: 'items#edit'
    patch '/items/:id', to: 'items#update'
    put '/items/:id', to: 'items#update'
    delete '/items/:id', to: 'items#destroy'
    # before
    # resources :discounts, only: [:index, :new, :create, :edit, :update, :destroy]
    # after
    get '/discounts', to: 'discounts#index'
    get '/discounts/new', to: 'discounts#new'
    post '/discounts', to: 'discounts#create'
    get '/discounts/:id/edit', to: 'discounts#edit'
    patch '/discounts/:id', to: 'discounts#update'
    put '/discounts/:id', to: 'discounts#update'
    delete '/discounts/:id', to: 'discounts#destroy'
    put '/items/:id/change_status', to: 'items#change_status'
    get '/orders/:id/fulfill/:order_item_id', to: 'orders#fulfill'
  end

  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    # before
    # resources :merchants, only: [:show, :update]
    # after
    get '/merchants/:id', to: 'merchants#show'
    patch '/merchants/:id/', to: 'merchants#update'
    # before
    # resources :users, only: [:index, :show]
    # after
    get '/users', to: 'users#index'
    get '/users/:id', to: 'users#show'
    patch '/orders/:id/ship', to: 'orders#ship'
  end
end
