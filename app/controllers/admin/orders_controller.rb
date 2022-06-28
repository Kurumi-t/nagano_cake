class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find_by(id: @order.customer_id)
    @cart_item = Cart_item.find_by(id: @order.)
  end

  def update
  end
end
