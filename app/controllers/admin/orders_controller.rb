class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order_items_all = @order.order_items.making_statuses.all
    @total = @order_items.inject(0) { |sum, order_item| sum + order_item.sum_price }
    @delivery_fee = 800
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)
    status_change_to_1 = @order.status_was == 0 and @order.status == 1
    @order.order_items.update(making_status: 1)
    if @order.status == 1
       @order_items.order.making_status == 1
       redirect_to admin_order_path(@order)
    else
       redirect_to admin_order_path(@order)
    end
  end





  def index
  end


  private

 def order_params
    params.require(:order).permit(:status)
 end

end
