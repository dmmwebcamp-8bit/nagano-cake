class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(making_status: params[:order_detail][:making_status])
    redirect_to admin_order_path(params[:order_id])
  end
end
