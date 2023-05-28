class Genre < ApplicationRecord

  has_many :items

  validates :name, presence: true, uniqueness: true

  after_update :update_item_is_active, if: :saved_change_to_is_active?

  def update_item_is_active
    if self.is_active == false
      self.items.update_all(is_active: false)
    end
  end

end
