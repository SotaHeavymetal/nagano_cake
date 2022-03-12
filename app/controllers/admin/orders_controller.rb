class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
     @total = 0
     @order = Order.find(params[:id])
     @order_details = @order.order_details.all
  end
  
  private
   def order_params
  params.require(:order).permit(:customer_id, :postal_code,:address, :name, :shipping_cost, :total_payment, :payment_method, :status)
   end
end
