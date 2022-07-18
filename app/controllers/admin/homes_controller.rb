class Admin::HomesController < ApplicationController
  def top
    @order_infos = OrderInfo.page(params[:page])
  end
end
