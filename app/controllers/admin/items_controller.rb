class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
    # @item = 
    # @genre = @item.genre.name

  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    item = Item.new(item_params)
    @genre_id = item.genre_id
    item.save
    redirect_to admin_item_path(item)
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre.name
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(@item)
  end


  private

  def item_params

    params.require(:item).permit( :image, :name, :introduction, :price, :genre_id, :is_active)

  end

end
