class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    #@customer = current_customer
    @customer = Customer.find(current_customer.id)
  end

  def edit
    #@customer = current_customer
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:notice] = "正しく保存できました。"
    redirect_to mypage_path
    else
       flash[:notice] = "正しく保存できませんでした。"
       render "edit"
    end
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
    # sign_out current_customer

  end



  private
 def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number)
 end

# def ensure_correct_customer
#   @customer = Customer.find(params[:id])
#   if current_customer.id = @customer.id
#     redirect_to root_path
#   end
# end

end
