class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string  :name,        null: false
      t.text    :description, null: false
      t.integer :genre_id,    null: false
      t.integer :price,       null: false
      t.boolean :is_active,   null: false, default: true

      t.timestamps
    end
  end
end
