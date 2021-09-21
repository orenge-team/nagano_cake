Rails.application.routes.draw do

  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"

   scope module: :public do
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"

    resource :customers, only: [:show, :edit, :update]
    resources :items, only: [:index, :show]
   end



  devise_for :admin, controllers:{
    sessions:     'admin/sessions'
  }

  devise_for :customers, controllers:{
    sessions: "customers/sessions",
    registrations: "customers/registrations"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
   resources :addresses, except:  [:new]

   resources :cart_items, only:  [:index, :create, :update, :destroy]
   delete 'cart_items/all_destroy' => 'cart_items#all_destroy'

   post 'orders/confirm' => 'orders#confirm'
   get 'orders/thanks' => 'orders#thanks'
   resources :orders, only: [:new, :create, :index, :show]


 end

  namespace :admin do
    get '/' => 'homes#top'

    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :customers, only:[:index, :show, :edit, :update]

  end
 end
