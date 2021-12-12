Rails.application.routes.draw do


  #管理者側のルーティング設定
  #URL/admin/sign_in...
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: 'homes#top'
    resources :customers, only:[:index, :show, :edit, :update]
    resources :products, except:[:destroy]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :orders, only:[:index, :show, :update]
  end

  #顧客用のルーティング設定
  #URL/customers/sign_in...
  root to: 'public/homes#top'

  devise_for :customer, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }



  scope module: :public do
    get "/about", to: "homes#about"
    get "customers/quit", to: "customers#quit"
    patch "customers/out", to: "customers#out"
    resources :customers, only:[:show, :edit, :update]
    resources :products, only:[:index, :show]
    resources :orders, only:[:new, :create, :index, :show] do
      collection do
        get "complete"
        post "check"
      end
    end
    resources :cart_products, except:[:show, :new, :edit]
    delete "/cart_products", to: "cart_products#destroy_all"
    resources :deliveries, except:[:new, :show]

      #検索機能
    get "/genre_search", to: "searches#genre_search"
    get "/products_search", to: "searches#products_search"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
