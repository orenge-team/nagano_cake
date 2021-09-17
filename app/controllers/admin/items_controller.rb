class Admin::ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
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
    params.require(:item).permit( :image_id, :name, :introduction, :price, :ganre, :is_active)
  end

end
