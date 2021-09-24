class HomesController < ApplicationController
  def top
   @items = Item.page(params[:page])
   @customer = current_customer
  end

  def about
  end
end
