Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html











  #customer側↓

  #ホーム画面ルーティング
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  scope module: :customer do

    #カスタマー
    resource :customers, only: [:show, :edit, :update]
      get 'customers/leave' => 'customers#leave'
      patch 'customers/withdraw' => 'customers#withdraw'

    #商品
    resources :products, only: [:index, :show]

    #配送先
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

    #注文
    resources :orders, only: [:index, :show, :create, :new]
      get 'orders/compleat' => 'orders#compleat'
      post 'orders/confirm' => 'orders#confirm'

    #カート商品
    resources :cart_products, only:[:index, :destroy, :edit, :update, :create]
      delete 'cart_products/destroy_all' => 'cart_products#destroy_all'
  end

  #admin側↓

  namespace :admin do
    #トップページのルーティング
    get 'admin' => 'homes#top'
    
    #カスタマー
    resources :customers, only:[:index, :show, :edit, :update]

    #ジャンル
    resources :genres, only:[:index, :edit, :create, :update]

    #商品
    resources :products, except:[:destroy]

    #注文
    resources :orders, only:[:show, :update]

    #注文詳細
    resources :order_details, only:[:update]
  end

end
