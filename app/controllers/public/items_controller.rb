class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
     @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

    private
def item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
end
end
