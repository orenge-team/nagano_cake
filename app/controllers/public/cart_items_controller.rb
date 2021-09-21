class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_items = current_customer.cart_items
    @item = Item.find(params[:item_id])
    cart.cart_items.create!(item_id: item.id)
    redirect_to cart_items_path
     
  end

  def update
     @cart_item.update(count: params[:count].to_i)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path(current_customer)
  end

  def all_destroy
    cart_item = CartItem.
    cart_item.destroy
    redirect_to cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :count )
    end

end
