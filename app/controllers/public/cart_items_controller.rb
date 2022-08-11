class Public::CartItemsController < ApplicationController
  
  
  
  def index
    @cart_items = current_customer.cart_items
    
    @sum = 0
    
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    #binding.pry
    #下記の記述でなんでできたか質問する
    if @already_cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @already_cart_item.amount += params[:cart_item][:amount].to_i
			@already_cart_item.save
      #@cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      #binding.pry
      
      @cart_item.save!
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "商品数を変更しました" 
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id]) 
    @cart_item.destroy  
    redirect_to cart_items_path 
  end

  def destroy_items
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
end
end
