Rails.application.routes.draw do

  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"

 

  devise_for :admin, controllers:{
    sessions:     'admins/sessions'
  }

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
  scope module: :public do
   resources :addresses, except:  [:new]
   
   post 'orders/confirm' => 'orders#confirm'
   get 'orders/thanks' => 'orders#thanks'
   resources :orders, only: [:new, :create, :index, :show]
   

 end

  namespace :admin do
    get '/' => 'homes#top'

    resources :genres, only:[:index, :create, :edit, :update]

    resources :items, except: [:destroy]

  end

   scope module: :public do
    resource :customer, only: [:show, :edit, :update]
    get "customer/unsubscribe" => "customer#unsubscribe"
    patch "customer/withdraw" => "customer#withdraw"
   end

end