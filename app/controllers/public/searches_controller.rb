class Public::SearchesController < ApplicationController
   def search
    @range = params[:range]
    @items = Item.page(params[:page]).per(8).order(:id)
    @genres = Genre.all
     if params[:genre_id].present?
       @genre = Genre.find(params[:genre_id])
       @items = @genre.items.page(params[:page]).per(8).order(:id)
     end

    if @range == "Item"
      @items = Item.looks(params[:search], params[:word])
    else

    end
   end
end
