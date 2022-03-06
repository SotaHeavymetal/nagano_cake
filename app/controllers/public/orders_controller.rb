class Public::OrdersController < ApplicationController

  def new
    @cart_items = current_customer.cart_items
    #@cart_item = Cart_item.new
    @order = Order.new
  end

  def confirm
    @orders = current_customer.orders
  end

  def complete
  end

  def create
  end

  def index
    @orders = Order.find(params[:id])
  end

  def show
    @orders = Order.find(params[:id])
    @order_detatils = @order.order_detatils
  end

  private
   def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
   end
end
