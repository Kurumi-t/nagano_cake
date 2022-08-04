class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "production"
      @order.update(status: "production")
    elsif @order.order_details.count == @order.order_details.where(making_status: "production_completed").count
      @order.update(status: "delivery_preparation")
    end
    redirect_to admin_order_path(@order_detail.order_id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end
