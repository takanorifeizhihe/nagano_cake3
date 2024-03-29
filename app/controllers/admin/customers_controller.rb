class Admin::CustomersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.page(params[:page])
  end

  def create
    
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end
end
