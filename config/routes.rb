Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #customer側↓
  
  #ホーム画面ルーティング
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  #customerコントローラーのルーティング
  resource :customers, only: [show, edit, update]
  get 'customers/leave' => 'customers#leave'
  patch 'customers/withdraw' => 'customers#withdraw'
  
  #productコントローラーのルーティング 
  resources :products, only: [:index, :show]
  
  #addressコントローラーのルーティング
  resources :addresses, except:[:show, :new]
  
  #orderコントローラーのルーティング
  resources :orders, only: [:index, :show, :create, :new]
  get 'orders/compleat' => 'orders#compleat'
  post 'orders/confirm' => 'orders#confirm'
  
  #cartproductコントローラーのルーティング
  resources :cart_products, only:[:index, :destroy, :edit, :update]
  delete 'cart_products/destroy_all' => 'cart_products#destroy_all'
  
  #admin側↓
  
  namespace :admin do
    #トップページのルーティング
    get 'admin' => 'homes#top'
    #customersコントローラーのルーティング
    resources :customers, only:[:index, :show, :edit, :update]
    
    #genresコントローラーのルーティング
    resources :genres, only:[:index, :edit, :create, :update]
    
    #productsコントローラーのルーティング
    resources :products, except:[:destroy]
    
    #ordersコントローラーのルーティング
    resources :orders, only:[:show, :update]
    
    #order_detailsコントローラーのルーティング
    resources :order_details, only:[:update]
  end
  
end
