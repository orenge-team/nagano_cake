class Public::OrdersController < ApplicationController

  def new
    # カート内商品、配送先が作成されてから記述
    @order = Order.new
    @customer = current_customer
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to orders_thanks_path(current_customer)
    else
      render :confirm
    end
  end

  def confirm
    
    @order = current_customer
  end

  def thanks
  end

  private

    def order_params
      params.require(:order).permit(:name,:postal_code,:address,:total_price,:delivery_fee,:status,:item_id,:payment_method)
    end

end

