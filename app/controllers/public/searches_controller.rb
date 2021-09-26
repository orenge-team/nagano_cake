class Public::SearchesController < ApplicationController
   before_action :authenticate_customer!
   def search
    @range = params[:range]

    if @range == "Item"
      @items = Item.looks(params[:search], params[:word])
    else

    end
   end
end
