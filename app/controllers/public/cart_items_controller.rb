class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.item.cart_item
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @count = CartItem.item_id
    if @count.update(cart_item_params)
    redirect_to cart_items_path
    else
    render :index
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path(current_customer)
  end

  def all_destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path(current_customer)
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :count )
    end

end
