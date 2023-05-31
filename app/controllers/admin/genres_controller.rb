class Admin::GenresController < Admin::ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの作成に成功しました"
      redirect_to request.referer
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンル情報の変更に成功しました"
      redirect_to admin_genres_path
      # ジャンル無効化時に所属商品も無効化
      @genre.items.update_all(is_active: false) unless @genre.is_active
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end
