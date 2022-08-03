class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "製作中"
      @order.update(status: "製作中")
    elsif @order.order_details.count == @order.order_details.where(making_status: "製作完了").count
      @order.update(status: "発送準備中")
    end
    redirect_to admin_order_path(@order_detail.order_id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end
end
