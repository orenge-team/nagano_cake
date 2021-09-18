class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Public::Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to address_path
    else
      @address = current_customer.public_addresses
      render :index
    end
  end

  def edit
    @address = Public::Address.find(params[:id])
  end

  def update
    @address = Public::Address.find(params[:id])
    if @address.update(address_params)
    redirect_to addresses_path(@address)
    else
    render :edit
    end
  end

  def destroy
    @address = Public::Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path

  end

  private
  def address_params
    params.require(:public_address).permit(:name, :postal_code, :address, :customer_id)
  end
end
