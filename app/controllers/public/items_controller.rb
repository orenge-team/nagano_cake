class  Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @customer = current_customer
    # @item =Item.all
    @genres = Genre.all
     if params[:genre_id].present?
       @genre = Genre.find(params[:genre_id])
       @items = @genre.items
     end
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre.name
    @cart_item = CartItem.new
    @customer = current_customer
  end
end

private

def item_params

    params.require(:item).permit( :image, :name, :introduction, :price, :genre_id, :is_active)

end
