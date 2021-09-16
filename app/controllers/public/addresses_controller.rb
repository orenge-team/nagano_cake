class Public::AddressesController < ApplicationController
  def index
    @address = Public::Address.new
    @addresses = Public::Address.all
  end
  
  def create
    @address = Public::Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to public_addresses_path(@address)
    else
      @address = Public::Address.all
      render :index
    end
  end

  def edit
    @address = Public::Address.find(params[:id])
  end

  def update
    @address = Public::Address.find(params[:id])
    if @address.update(address_params)
    redirect_to public_addresses_path(@address)
    else
    render :edit
    end
  end

  def destroy
    @address = Public::Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
    
  end
end
