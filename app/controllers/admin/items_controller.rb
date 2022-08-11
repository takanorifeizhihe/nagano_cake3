class Admin::ItemsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def new
    @item=Item.new
  end

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def create
    @item = Item.new(item_params)
    #binding.pry
    @item.save!
    if @item.errors.any?
      @item.errors.full_messages.each do |msg|
        pp msg
      end
    end
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end
