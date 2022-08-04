class Public::OrderInfosController < ApplicationController
  def new
    @order_info = OrderInfo.new
  end

  def index
    
    @order_infos = OrderInfo.all
  end

  def create
    @order_info = OrderInfo.new(order_info_params)
    @order_info.customer_id = current_customer.id
    @order_info.save
    cart_items = current_customer.cart_items
    
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_info_id = @order_info.id
      order_detail.item_id= cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.price = (cart_item.item.price * 1.1).floor
      order_detail.save
    end
       
    cart_items.destroy_all
    redirect_to order_infos_complete_path
  end

  def show
    @order_info = OrderInfo.find(params[:id])
    @order_details = @order_info.order_details
  end

  def confirm
    @cart_items = CartItem.all
    @sum = 0
    @order_info = OrderInfo.new(order_info_params)
    if params[:order_info][:@select_address] == '0'
      
      @order_info.postal_code = current_customer.postal_code
      @order_info.address = current_customer.address
      @order_info.name = current_customer.first_name + current_customer.last_name
      
    elsif params[:order_info][:@select_address] == '1'
      
      @address = Address.find(params[:order_info][:address_id])
      @order_info.postal_code = @address.postal_code
      @order_info.address = @address.address
      @order_info.name = @address.name
      
    else
      
    end
  end

  def complete
    
    
    
  end
  
  private
  
  def order_info_params
    params.require(:order_info).permit(:payment_method, :postal_code, :address, :name, :customer_id, :billing_amount, :postage)
  end
end
