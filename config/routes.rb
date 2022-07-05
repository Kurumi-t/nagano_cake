Rails.application.routes.draw do
  root to: "public/homes#top"
  get '/about' => 'public/homes#about'
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  post '/orders/confirm' => 'public/orders#confirm'
  get '/orders/thanks' => 'public/orders#thanks'
  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
  get '/customers/my_page' => 'public/customers#show'
  get '/customers/withdraw' => 'public/customers#withdraw'
  patch '/customers/withdraw_update' => 'public/customers#withdraw_update'
  
  scope module: :public do
    resources :addresses, only: [:create, :destroy, :edit, :index, :update]
    resources :orders, only: [:new, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :edit]
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:index, :show]
  end
  
  get '/admin' => 'admin/homes#top'
  
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :orders_details, only: [:update]
  end
  
end
