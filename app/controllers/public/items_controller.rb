class Public::ItemsController < ApplicationController
  
  before_action :authenticate_customer!
  
  def index
    @genres = Genre.all
    @item_all = Item.all
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
