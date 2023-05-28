class Public::ItemsController < Public::ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = Item.joins(:genre).where(genre: { is_active: true }, genre_id: params[:genre_id], is_active: true).order(id: "DESC").page(params[:page]).per(8)
    elsif params[:search]
      @keyword = params[:search]
      @items_all = Item.search(@keyword)
      @items = @items_all.page(params[:page]).per(8)
    else
      @items = Item.joins(:genre).where(genre: { is_active: true }, is_active: true).order(id: "DESC").page(params[:page]).per(8)
    end
    @genres = Genre.where(is_active: true)
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

end
