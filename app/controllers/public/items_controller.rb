class Public::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all
    @items_page = Item.page(params[:page]).per(8)
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end
end
