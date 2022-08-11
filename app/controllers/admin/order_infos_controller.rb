class Admin::OrderInfosController < ApplicationController
  
  
  
  def index
    @order_infos = OrderInfo.all
    @order_details = @order_info.order_details
    @order_details.each do |order_detail|
      @order.info.total_amount += order_detail.amount
    end
  end
  
  def show
    @order_info = OrderInfo.find(params[:id])
    @order_details = @order_info.order_details
    @sum = 0
  end

  def update
    @order_info = OrderInfo.find(params[:id])
    #binding.pry
    @order_info.update(order_info_params)
    if @order_info.status == "confirmation_of_payment"
      @order_info.order_details.update_all(making_status: "production_pending")
      flash[:notice] = "注文/制作ステータスを更新しました。"
      redirect_to admin_order_info_path(@order_info.id)
    else 
      flash[:notice] = "注文ステータスを更新しました。"
      redirect_to admin_order_info_path(@order_info.id)
    end
  end
  
  private
  
  def order_info_params
    params.require(:order_info).permit(:payment_method, :postal_code, :address, :name, :customer_id, :billing_amount, :postage, :status)
  end
end
