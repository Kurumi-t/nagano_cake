class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    
    @total_price = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer
    @cart_item.save
    binding.pry
    redirect_to cart_items_path
  end
    
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(@cart_item_params)
    redirect_to cart_items_path(@cart_item.id)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_item(@cart_item.id)
  end

  def destoy_all
    current_customer.cart_items.destoy_all
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
