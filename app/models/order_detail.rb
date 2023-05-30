class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: { can_not_start:0,
                        waiting_for_making:1,
                        process_in_making:2,
                        finished_making:3}

  def key
    OrderDetail.making_statuses[making_status]
  end

  def sub_total
    price * quantity
  end
end
