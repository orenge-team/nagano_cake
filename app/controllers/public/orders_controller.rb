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
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_items|
        order_item = OrderItem.new
        order_item.item_id = cart_items.item_id
        order_item.order_id = @order.id
        order_item.count = cart_items.count
        order_item.price = cart_items.item.price
        order_item.save
      end
      redirect_to orders_thanks_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
      @delivery_fee = 800
      @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.name = current_customer.first_name+current_customer.last_name
      @order.address = current_customer.address
      @order.address = current_customer.postal_code
      @order.delivery_fee = 800

    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered])
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
      else
        render :new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(order_params)
    if address_new.save
    else
      render :new
    end
    else
      redirect_to address_new_path
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end

  def thanks
  end

  private

    def order_params
      params.require(:order).permit(:name,:postal_code,:address,:total_price,:delivery_fee,:status,:item_id,:payment_method,:customer_id)
    end

end

