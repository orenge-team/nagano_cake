class  Public::ItemsController < ApplicationController
  def index
    @item_counts = Item.all
    @items = Item.page(params[:page]).per(8).order(:id)
    @customer = current_customer
    @genres = Genre.all
     if params[:genre_id].present?
       @genre = Genre.find(params[:genre_id])
       @item_counts = @genre.items
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
