class Admin::CustomersController < ApplicationController
before_action :authenticate_admin!

  def index
    @customer = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    if @customer = Customer.find(params[:id])
       @customer.update(customer_params)
       redirect_to admin_customers_path
    else
       flash[:notice] = "正しく保存できませんでした。"
       redirect_to edit_admin_customers_path(@customer)
    end
  end

 private
 def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number)
 end
end
