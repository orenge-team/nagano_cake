class Admin::CustomersController < ApplicationController
  def index
    @customers=Customer.all
  end
  
  def show
    @cusomer = Cusomer.find(params[:id])
  end

  def edit
    @cusomer = Cusomer.find(params[:id])
  end


  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to todolist_path(list.id)
  end

 private
  def customer_params
    params.require(:customer).permit(:title, :body)
  end

end
