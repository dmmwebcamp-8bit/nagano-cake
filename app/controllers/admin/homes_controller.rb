class Admin::HomesController < Admin::ApplicationController

  def top
    @orders = Order.all.order(created_at: "DESC").page(params[:page]).per(10)
  end
end
