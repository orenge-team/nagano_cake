class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order = Order.new
    @customer = current_customer
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
      @item = Item.find_by(id:@cart_item.item_id)
      redirect_to item_path(@item.id)
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])

    @cart_item.update(count: params[:count].to_i)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path(current_customer)
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :count )
    end

end
