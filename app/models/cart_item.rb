class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def subtotal
     ((item.price * amount) * 1.1).round
  end

end
