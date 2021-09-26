class Public::SearchesController < ApplicationController
   def search
    @range = params[:range]

    if @range == "Item"
      @items = Item.looks(params[:search], params[:word])
    else

    end
   end
end
