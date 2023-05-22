class AddIsActiveToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :is_active, :boolean, null: false, default: true
  end
end
