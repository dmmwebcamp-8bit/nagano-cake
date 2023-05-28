class Admin::GenresController < Admin::ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      if request.referer == new_admin_item_url
        flash[:notice] = "ジャンルの作成に成功しました"
        redirect_to request.referer
      else
        flash[:notice] = "ジャンルの作成に成功しました"
        redirect_to admin_genres_path
      end
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
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end
