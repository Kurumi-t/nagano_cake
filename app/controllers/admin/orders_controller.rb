class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.status == "payment_confirmation"
      @order_details.update_all(making_status: "waiting_production")
    end
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method, :status)
  end
end
