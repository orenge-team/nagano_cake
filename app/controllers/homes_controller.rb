class HomesController < ApplicationController
  def top
   @items = Item.page(params[:page]).order(created_at: :desc).limit(4)
   @customer = current_customer
  end

  def about
  end
end
