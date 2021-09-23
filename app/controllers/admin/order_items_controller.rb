class Admin::OrderItemsController < ApplicationController

   def update
     @order = Order.find(params[:id])
     @order_items = OrderItem.find(params[:id])
     @order_items.update(order_item_params)
     redirect_to admin_order_path(@order)
   end


 private
   def order_item_params
     params.require(:order_item).permit(:making_status)
   end

end