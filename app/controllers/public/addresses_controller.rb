class Public::AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @address_new = Address.new
      @addresses = current_customer.address
      render :index
    end
  end
  
  def update
    @address = Addoress.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end


private
 def address_params
  params.require(:address).permit(:customer_id, :name, :postal_code, :address)
 end
end