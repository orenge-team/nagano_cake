class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = @order_items.inject(0) { |sum, order_item| sum + order_item.sum_price }
    @delivery_fee = 800
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)
    if @order.status == "入金待ち"
      @order_items.each do |order_item|
        order_item.making_status = "着手不可"
        order_item.save
      end
    elsif @order.status == "入金確認"
      @order_items.each do |order_item|
        order_item.making_status = "製作待ち"
        order_item.save
      end
    end
    redirect_to admin_order_path(@order)
  end





  def index
  end


  private

 def order_params
    params.require(:order).permit(:status)
 end

end
