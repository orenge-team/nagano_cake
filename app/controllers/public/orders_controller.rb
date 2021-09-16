class Public::OrdersController < ApplicationController

  def new
    # カート内商品、配送先が作成されてから記述
    @order = Public::Order.new
  end

  private

    def order_params
      params.require(:order).permit(:name,:postal_code,:address,:total_price,:delivery_fee,:status,:item_id,:payment_method)
    end

end

