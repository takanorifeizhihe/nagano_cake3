class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find([:order_info_id][:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_info_path(@order_info)
  end
  
   private

  def order_detail_params
    params.require(:order_detail).permit(:order_info_id, :item_id, :price, :amount, :making_status)
  end
end
