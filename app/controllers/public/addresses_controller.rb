class Public::AddressesController < ApplicationController

  def index
    @customer = current_customer
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path(current_customer)
    else
      @address = current_customer.addresses
      render :index
    end
  end

  def edit
    @customer = current_customer
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
    redirect_to addresses_path
    else
    render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path(current_customer)
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end

end
