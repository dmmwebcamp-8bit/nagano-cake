class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = Item.where(genre_id: params[:genre_id], is_active: true).page(params[:page]).per(8).order(id: "DESC")
    else
      @items = Item.where(is_active: true).page(params[:page]).per(8).order(id: "DESC")
    end
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
