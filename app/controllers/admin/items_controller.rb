class Admin::ItemsController < ApplicationController

  def index
    @item = Book.new
    @items = Book.all
  end

  def new
    @item = Book.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      @items = Item.all
      render "items/show"
    end
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
   if @item.update(item_params)
    redirect_to item_path(@item)
   else
    render "edit"
   end
  end

  private
  def item_params
    params.require(:item).permit(:title, :body, :profile_image)
  end
end
