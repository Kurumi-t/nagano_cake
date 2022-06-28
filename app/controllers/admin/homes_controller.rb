class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
    #@order = Order.find(params[:id])
    #@customer = Customer.find_by(id: @order.customer_id)
    
  end
end