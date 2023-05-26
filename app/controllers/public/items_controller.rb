class Public::ItemsController < Public::ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = Item.joins(:genre).where(genre: { is_active: true }, genre_id: params[:genre_id], is_active: true).order(id: "DESC").page(params[:page]).per(8)
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

  # def genre_search
  #   @genres = Genre.order(:name)
  #   @genre = Item.where(genre_id: params[:genre_id]).where(sell_status: '1')
  #   @items = @genre.order("created_at DESC").page(params[:page]).per(8)
  #   @genre_name = Genre.find(params[:genre_id])
  # end

  def search
    @genres = Genre.order(:name)
    @keyword = search_params[:search]
    @items_all = Item.search(@keyword)
    @items = Kaminari.paginate_array(@items_all).page(params[:page]).per(8)
  end

  private
  
  def search_params
    params.permit(:search)
  end

end
