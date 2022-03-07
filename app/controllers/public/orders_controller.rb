class Public::OrdersController < ApplicationController

  def new
    @cart_items = current_customer.cart_items
    @order = Order.new
    #@cart_item = Cart_item.new
    #@customer = current_customer.customers
  end

  def confirm
     @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def complete
  end

  def create
  end

  def index
    @order = Order.find(params[:id])
  end

  def show
    #@order = Order.find(params[:id])
  end

  private
   def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :select_address)
   end
end
