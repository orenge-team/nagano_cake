class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = @order_items.inject(0) { |sum, order_item| sum + order_item.sum_price }
    @delivery_fee = 800
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end


 
  

  def index
  end


  private

 def order_params
    params.require(:order).permit(:status)
 end

end
