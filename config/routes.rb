Rails.application.routes.draw do
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :public do
   resources :order, only: [:new, :create, :index, :show]
   post 'order/confirm' => 'orders#confirm'
   get 'order/thanks' => 'orders#thanks'
 end
end
