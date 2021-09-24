class Admin::OrderItemsController < ApplicationController

   def update
     @order_items = OrderItem.find(params[:id])
     @order = @order_items.order
     @order_items.update(order_item_params)
    if @order_items.making_status == "製作中"
        @order.update(status: "製作中")
    elsif @order.order_items.all?{ |order_item| order_item.making_status == "製作完了"}
        @order.update(status: "発送準備")
    end
     redirect_to request.referer
   end

 private
   def order_item_params
     params.require(:order_item).permit(:making_status)
   end

end
