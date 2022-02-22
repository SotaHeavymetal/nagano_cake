class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    if @customer = Customer.find(params[:id])
       @customer.update(customer_params)
       redirect_to customers_my_page_path
    else
       flash[:notice] = "正しく保存できませんでした。"
       render "edit"
    end
  end

  def unsubscribe
    @user = Customer.find_by(name: params[:name])
  end

  def withdraw
    @customer = Customer.find_by(name: params[:name])
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private
 def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number)
 end
end
