class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @cart_items = current_customer.cart_items
    @order = Order.new
    #@cart_item = Cart_item.new
    #@customer = current_customer.customers
  end

  def confirm
      @order = Order.new(order_params)
    if params[:order][:select_address] == "my_address"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "registered_address"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id].to_i)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      # params[:order][:address_id] == 2
      @order = Order.new(order_params)
    end
    @cart_items = current_customer.cart_items
    @total = 0
    @order.shipping_cost = 800
    @cart_items.each do |cart_item|
    @total += cart_item.subtotal
    end
    @order.total_payment = @order.shipping_cost + @total
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
    current_customer.cart_items.each do |cart_item|
      @order_details = OrdersDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.making_status = 0
      @order_details.save
    end
    current_customer.cart_items.destroy_all
  end
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders

  end

  def show
    @orders = Order.find(params[:id])
  end

  private
   def order_params
  params.require(:order).permit(:customer_id, :postal_code,:address, :name, :shipping_cost, :total_payment, :payment_method, :status)
   end
end
