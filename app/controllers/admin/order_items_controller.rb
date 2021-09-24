class Admin::OrderItemsController < ApplicationController

   def update
     @order_items = OrderItem.find(params[:id])
     @order = @order_items.order
     @order_items.update(order_item_params)
<<<<<<< HEAD

     if @oeder_item.making_status == "製作中"
         @order.update(status: "製作中")
     　　redirect_to admin_order_path(@order)
     end
   end

=======
     if @order_items.making_status == "製作中"
        @order.update(status: "製作中")
        redirect_to admin_order_path(@order)
      elsif @order_items.making_status == "製作完了"
            @order.update(status: "発送準備")
            redirect_to admin_order_path(@order)
     else
      redirect_to admin_order_path(@order)
     end
    end
>>>>>>> origin/develop

 private
   def order_item_params
     params.require(:order_item).permit(:making_status)
   end

end
