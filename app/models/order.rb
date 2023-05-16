class Order < ApplicationRecord

 has_many :order_details, dependent: :destroy

 belongs_to :customer

 enum payment_method: {transfer:0, credit_card:1}

 enum status: { waiting_for_payment:0,
                confirm_payment:1,
                making_products:2,
                packaging_products:3,
                shipped_products:4}


end
