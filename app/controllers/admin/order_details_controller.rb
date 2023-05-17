class Admin::OrderDetailsController < ApplicationController

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(making_status: params[:making_status])
    redirect_to admin_order_path(params[:order_id])
  end
end
