class HomesController < ApplicationController
  def top
   @items = Item.page(params[:page]).order(created_at: :desc).limit(4)
   @customer = current_customer
   @genres = Genre.all
     if params[:genre_id].present?
       @genre = Genre.find(params[:genre_id])
       @items = @genre.items.page(params[:page]).order(created_at: :desc).limit(4)
     end
  end

  def about
  end
end
