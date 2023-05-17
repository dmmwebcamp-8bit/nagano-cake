class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.order(id: "ASC").page(params[:page]).per(10)
  end
end
