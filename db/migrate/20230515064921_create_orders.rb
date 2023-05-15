class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,     null: false
      t.integer :payment_method,  null: false, default: 0
      t.integer :total_cost,      null: false
      t.integer :shipping_cost,   null: false
      t.string  :name,            null: false
      t.string  :postal_code,     null: false
      t.string  :address,         null: false
      t.integer :status,          null: false, default: 0

      t.timestamps
    end
  end
end
