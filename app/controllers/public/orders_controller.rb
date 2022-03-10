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

  end

  def complete
  end

  def create
    #@cart_items.each do |cart_item|
    #order tableとorder_detailsにデータを保存する
    #if文は不要
    
      
  end

  def index
    @order = Order.find(params[:id])
  end

  def show
    #@order = Order.find(params[:id])
  end

  private
   def order_params
  params.require(:order).permit(:customer_id, :postal_code,:address, :name, :shipping_cost, :total_payment, :payment_method, :status)
   end
end
