Rails.application.routes.draw do


  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"

  devise_for :admin, controllers:{


    sessions:     'admins/sessions'
  }

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :public do
   resources :order, only: [:new, :create, :index, :show]
   post 'order/confirm' => 'orders#confirm'
   get 'order/thanks' => 'orders#thanks'
 end

  namespace :admin do
    get '/' => 'homes#top'
  end

   scope module: :public do
    resource :customer, only: [:show, :edit, :update]
    get "customer/unsubscribe" => "customer#unsubscribe"
    patch "customer/withdraw" => "customer#withdraw"
   end

end
