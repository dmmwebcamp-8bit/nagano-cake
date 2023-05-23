class Admin::ItemsController < Admin::ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      @genres = Genre.all
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      @genres = Genre.all
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :genre_id, :price, :is_active, :image)
  end
end
