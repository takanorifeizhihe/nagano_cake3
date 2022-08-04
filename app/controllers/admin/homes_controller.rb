class Admin::HomesController < ApplicationController
  def top
    @order_infos = OrderInfo.page(params[:page]).order(created_at: :desc)
    
   
  end
end
