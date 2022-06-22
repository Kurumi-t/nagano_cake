Rails.application.routes.draw do
  get '/' => 'public/homes#top', as: '/top'
  get '/about' => 'public/homes#about', as: '/about' 
  
  scope module: :public do
    resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show]
    resources :cart_items, only: [:update, :destroy, :destroy_all, :edit]
    resources :customers, only: [:show, :edit, :update, :withdraw, :withdraw_update]
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :withdraw, :withdraw_update]
  end
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  get '/admin' => 'admin/homes#top', as: '/admin'
  
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :orders_details, only: [:update]
  end
  
end
