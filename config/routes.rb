Rails.application.routes.draw do

  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"

  devise_for :admins, controllers:{
    sessions:     'admins/sessions',
    passwords:    'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
  scope module: :public do
   resources :addresses, except:  [:new]
    
   resources :orders, only: [:new, :create, :index, :show]
   post 'orders/confirm' => 'orders#confirm'
   get 'orders/thanks' => 'orders#thanks'

 end

  namespace :admin do
    get '/' => 'homes#top'
  end


end
