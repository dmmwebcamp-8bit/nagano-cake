class Public::ItemsController < Public::ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items_all = Item.joins(:genre).where(genre: @genre, is_active: true)
    elsif params[:search]
      @keyword = params[:search]
      @items_all = Item.search(@keyword)
    else
      @items_all = Item.joins(:genre).where(genre: { is_active: true }, is_active: true)
    end
    @items = @items_all.order(id: "DESC").page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
  end

end
