class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find_by(id: @order.customer_id)
    @cart_item = Order.find_by(id: @order.id)
    @item = Item.find_by(id: @cart_item.item_id)
    @order_details = Order_detail.find_by(id: @order/)
  end

  def update
  end
end
