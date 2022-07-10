Rails.application.routes.draw do
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
 
  scope module: :public do
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    get '/customers/my_page' => 'customers#show'
    get '/customers/withdraw' => 'customers#withdraw'
    patch '/customers/withdraw_update' => 'customers#withdraw_update'
    resources :addresses, only: [:create, :edit, :index, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy]
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:index, :show]
  end

  namespace :admin do
    get '/admin' => '/homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :orders_details, only: [:update]
  end
  
end