class Admin::OrderInfosController < ApplicationController
  
  def index
    @order_infos = OrderInfo.all
    @order_details = @order_info.order_details
    @order_details.each do |order_detail|
      @order.info.total_amount += order_detail.amount
    end
  end
  
  def show
    @order_infos = @order_info.OrderDetail.all
  end

  def update
    @order_info = OrderInfo.find(params[:id])
    @order_info.update(order_info_params)
    redirect_to admin_order_info_path(@order_info)
  end
  
  private
  
  def order_info_params
    params.require(:order_info).permit(:payment_method, :postal_code, :address, :name, :customer_id, :billing_amount, :postage, :status)
  end
end
