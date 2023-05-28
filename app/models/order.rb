class Order < ApplicationRecord

 has_many :order_details, dependent: :destroy

 belongs_to :customer

 enum payment_method: {transfer:0, credit_card:1}

 enum status: { waiting_for_payment:0,
                confirm_payment:1,
                making_products:2,
                packaging_products:3,
                shipped_products:4}

  ## 注文詳細の数量の合計を返す
  def total_amount
    amount = 0
    order_details.each do |order_detail|
      amount += order_detail.quantity
    end
    return amount
  end

end
