Rails.application.routes.draw do

<<<<<<< HEAD
=======
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  
>>>>>>> a936c0ff7c4f794e0893bb8e5b787e7ee436ac53
  devise_for :admins, controllers:{
    sessions:     'admins/sessions',
    passwords:    'admins/passwords',
    registrations: 'admins/registrations'
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


end
