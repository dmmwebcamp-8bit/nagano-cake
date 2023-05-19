class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    hash = params[:order][:status]

    if Order.statuses[@order.status] >= Order.statuses[hash]
      flash[:notice] = "注文ステータスは変更できません。"
      render :show
    else
      @order.update(status: params[:order][:status])
      flash[:notice]="注文ステータスを" + Order.statuses_i18n[@order.status] + "に変更しました。"

      if Order.statuses[@order.status] == 1
        @order.order_details.update_all(making_status: OrderDetail.making_statuses.key(1))
        flash[:notice]+= "\n" + "製作ステータスを" + OrderDetail.making_statuses_i18n[OrderDetail.making_statuses.key(1)] + "に変更しました。"
      end
      redirect_to admin_order_path(@order.id)
    end

  end
end
