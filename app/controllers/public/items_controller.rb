class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    #@item = Item.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(8)
    else
      @items = Item.page(params[:page]).per(8)
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

  def search
   @items = Item.search(params[:keyword])
   @keyword = params[:keyword]
  render "index"
  end

    private
     def item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :amount, :genre_id)
     end
end
