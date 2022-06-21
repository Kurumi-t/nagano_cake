Rails.application.routes.draw do
  namespace :admin do
    get "homes/top" => "homes#top", as: "/"
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:show, :update]
  end
  
  namespace :public do
    get 'homes/top' => "homes#top", as: "/" 
    get 'homes/about' => "homes#about", as: "/about" 
    resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show]
    resources :cart_items, only: [:update, :destroy, :destroy_all, :edit]
    resources :customers, only: [:show, :edit, :update, :withdraw, :withdraw_update]
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :withdraw, :withdraw_update]
  end
  
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}

# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  
end
