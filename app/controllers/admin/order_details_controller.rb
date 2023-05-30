class Admin::OrderDetailsController < Admin::ApplicationController

  def update
    order = Order.find(params[:order_id])
    order_detail = OrderDetail.find(params[:id])
    key = OrderDetail.making_statuses[params[:order_detail][:making_status]]

    ### 実行前データ確認 ###
    if order.key == 0
      flash[:danger] = "注文の入金確認ができておりません。"
      redirect_to admin_order_path(order.id)
      return
    end
    if order_detail.key >= key
      flash[:danger] = "製作ステータスは変更できません。"
      redirect_to admin_order_path(order.id)
      return
    end

    ### データ更新 ###
    order_detail.update(making_status: key)
    flash[:notice] = "製作ステータスを" + order_detail.making_status_i18n + "に変更しました。"
    # order.statusの更新
    details = order.order_details
    case order_detail.key
    when 2
      if order.key == 1
        order.update(status: 2)
        flash[:notice] += "注文ステータスを" + order.status_i18n + "に変更しました。"
      end
    when 3
      if details.count == details.select{|c| c.key == 3}.count
        order.update(status: 3)
        flash[:notice] += "注文ステータスを" + order.status_i18n + "に変更しました。"
      end
    end

    redirect_to admin_order_path(order.id)
  end
end
