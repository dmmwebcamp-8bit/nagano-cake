class Admin::OrdersController < Admin::ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    key = Order.statuses[params[:order][:status]]

    ### 実行前データ確認 ###
    if @order.key >= key
      flash.now[:danger] = "注文ステータスは変更できません。"
      render :show
      return
    end

    ### データ更新 ###
    @order.update(status: key)
    flash[:notice]="注文ステータスを" + @order.status_i18n + "に変更しました。"
    if @order.key == 1
      @order.order_details.update_all(making_status: 1)
      flash[:notice] += "製作ステータスを" + OrderDetail.making_statuses_i18n.values[1] + "に変更しました。"
    end
    redirect_to admin_order_path(@order.id)

  end
end
