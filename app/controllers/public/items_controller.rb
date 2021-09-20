class  Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre.name
  end
end

private

def item_params

    params.require(:item).permit( :image, :name, :introduction, :price, :genre_id, :is_active)

end
