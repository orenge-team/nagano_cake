class Admin::ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new
    item.save
    redirect_to request.referer
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end


  private

  def item_params
    params.require(:list).permit( :image_id, :name, :introduction, :price, :ganre, :is_active)
  end


end
