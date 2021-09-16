Rails.application.routes.draw do

  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  
  devise_for :admin, controllers:{


    sessions:     'admins/sessions'
  }

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   resources :order, only: [:new, :create, :index, :show]
   post 'order/confirm' => 'orders#confirm'
   get 'order/thanks' => 'orders#thanks'
   
   resources :addresses, except:  [:new]
   

  namespace :admin do
    get '/' => 'homes#top'
  end


end
