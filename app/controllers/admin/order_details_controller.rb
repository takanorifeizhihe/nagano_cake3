class Admin::OrderDetailsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def update
    #@order_info = OrderInfo.find(params[:id])
    #@order_details = @order_info.order_details
    @order_detail = OrderDetail.find(params[:order_detail][:order_detail_id])
    @order_detail.update(order_detail_params)

    if @order_detail.making_status == "in_progress"
      
      @order_detail.order_info.update(status: "under_production")
      flash[:notice] = "注文/制作ステータスを更新しました。"
      
    elsif @order_detail.order_info.order_details.count == OrderDetail.where(making_status: 'finished', order_info_id: @order_detail.order_info_id).count
      
      @order_detail.order_info.update(status: "preparing_to_ship")
      flash[:notice] = "注文/制作ステータスを更新しました。"
      
    else 
      flash[:notice] = "制作ステータスを更新しました。"
      
    end
    redirect_to admin_order_info_path(@order_detail.order_info.id)
  end
  
  
   private

  def order_detail_params
    params.require(:order_detail).permit(:order_info_id, :item_id, :price, :amount, :making_status)
  end
end
