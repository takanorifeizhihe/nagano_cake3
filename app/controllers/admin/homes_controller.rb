class Admin::HomesController < ApplicationController
  
  before_action :authenticate_admin!
  
  def top
    @order_infos = OrderInfo.page(params[:page]).order(created_at: :desc)
    
   
  end
end
