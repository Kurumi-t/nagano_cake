class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
    @order = Order.new(order_params)
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
    @customer = current_customer
    cart_items = @customer.cart_items.all
    @order = @customer.order.new(order_params)
    if @order.save
      cart_items.each do |order|
        order_item = OrderItem.new
        order_item.id = @order.id
        order_item.item_id = cart_item.item_id
        order_item.order_amount = cart.amount
        order_item.save
      end
      redirect_to orders_thanks_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method, :status)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
end
