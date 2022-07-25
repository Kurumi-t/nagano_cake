class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if params[:order][:select_address] == "1"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name
    elsif params[:order][:select_address] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "3"
      address_new = @customer.addresses.new(address_params)
      if address_params.blank?
        render :new
      else
        address_new.save
      end
    end
    @cart_items = @customer.cart_items.all
    @total_price = 0
    @total_payment = @order.shopping_cost
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    cart_items = current_customer.cart_items.all
    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.with_tax_price
        order_detail.making_status = 1
        order_detail.save
      end
      cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      @order = Order.new(order_params)
      @customer = current_customer
      render :new
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @total_price = 0
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method, :status)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
end
