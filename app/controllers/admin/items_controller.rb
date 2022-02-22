class Admin::ItemsController < ApplicationController
  
  def index
    # @items = Item.page(params[:page].per(10))
    @item = Item.new
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path(@item)
    else
      redirect_to new_admin_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
   if @item.update(item_params)
    redirect_to admin_item_path(@item)
   else
    render "edit"
   end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end
end
