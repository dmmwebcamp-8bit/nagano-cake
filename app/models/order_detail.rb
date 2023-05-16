class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: { can_not_start:0,
                        waiting_for_making:1,
                        process_in_making:2,
                        finished_making:3}

end
