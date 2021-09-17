class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
    
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
<<<<<<< HEAD
    params.require(:item).permit( :image_id, :name, :introduction, :price, :ganre, :is_active)
=======
    params.require(:list).permit( :image, :name, :introduction, :price, :ganre, :is_active)
>>>>>>> origin/admin/items
  end

end
