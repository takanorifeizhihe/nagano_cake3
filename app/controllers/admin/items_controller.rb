class Admin::ItemsController < ApplicationController
  def new
    @item=Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    if @item.errors.any?
      @item.errors.full_messages.each do |msg|
        pp msg
      end
    end
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
  end

  def edit
  end
  
  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end
