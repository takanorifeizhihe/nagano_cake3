class Admin::HomesController < ApplicationController
  def top
    @order_infos = OrderInfo.page(params[:page]).order(created_at: :desc)
    
    @order_details = OrderDetail.all
    @total_amount = 0
    @order_details.each do |order_detail|
     @total_amount += order_detail.amount
    end
  end
end
