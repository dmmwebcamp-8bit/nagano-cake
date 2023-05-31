class Public::HomesController < Public::ApplicationController

  def top
    @items = Item.joins(:genre).where(genre: { is_active: true }, is_active: true).order(id: "DESC").limit(4)
  end

  def about
  end

end
