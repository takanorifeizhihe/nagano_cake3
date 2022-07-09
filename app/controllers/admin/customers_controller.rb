class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def create
    
  end

  def update
  end

  def edit
  end
end
