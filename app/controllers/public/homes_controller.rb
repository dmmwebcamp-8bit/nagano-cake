class Public::HomesController < ApplicationController
  def top
    @items = Item.joins(:genre).where(genre: { is_active: true }, is_active: true).order(id: "DESC").limit(4)
    @genres = Genre.where(is_active: true)
  end

  def about
  end
end
