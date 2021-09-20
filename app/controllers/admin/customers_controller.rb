class Admin::CustomersController < ApplicationController
  def index
    @customers=Customer.page(params[:page])
  end
  
  def show
    @customer = Cusomer.find(params[:id])
  end

  def edit
    @customer = Cusomer.find(params[:id])
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
