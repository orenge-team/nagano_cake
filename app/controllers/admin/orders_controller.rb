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


    if @order.status == "入金確認"
      @order_items.update(making_status: "製作待ち")
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
