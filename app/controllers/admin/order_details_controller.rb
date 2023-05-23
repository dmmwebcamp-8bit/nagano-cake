class Admin::OrderDetailsController < Admin::ApplicationController

  def update
    flash[:notice] = ""
    order = Order.find(params[:order_id])
    if order.status == Order.statuses.key(0)
      flash[:notice] = "注文の入金確認ができておりません。"
      redirect_to admin_order_path(order.id)
    else
      # order_detail.making_statusの更新
      order_detail = OrderDetail.find(params[:id])
      hash = params[:order_detail][:making_status]
      if OrderDetail.making_statuses[order_detail.making_status] >= OrderDetail.making_statuses[hash]
        flash[:notice] = "製作ステータスは変更できません。"
        redirect_to admin_order_path(order.id)
      else
        order_detail.update(making_status: params[:order_detail][:making_status])
        # order.statusの更新
        details = order.order_details
        case order_detail.making_status
        when OrderDetail.making_statuses.key(2)
          # 製作ステータスが"製作中"に変更された場合
          # 注文ステータスが"入金確認"であれば"製作中"に変更
          if Order.statuses[order.status] == 1
            order.update(status: Order.statuses.key(2))
            flash[:notice] = "注文ステータスを" + Order.statuses_i18n[order.status] + "に変更しました。"
          end
        when OrderDetail.making_statuses.key(3)
          # 製作ステータスがすべて"製作完了"になった場合
          # 注文ステータスを"発送準備中"に変更
          if details.count == details.select{|c| c.making_status == OrderDetail.making_statuses.key(3)}.count
            order.update(status: Order.statuses.key(3))
            flash[:notice] = "注文ステータスを" + Order.statuses_i18n[order.status] + "に変更しました。"
          end
        else
        end
        redirect_to admin_order_path(params[:order_id])
        flash[:notice] += "製作ステータスを" + OrderDetail.making_statuses_i18n[order_detail.making_status] + "に変更しました。"
      end
    end
  end
end
