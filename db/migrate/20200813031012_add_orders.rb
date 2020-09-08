class AddOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :name, :string
    add_column :orders, :small_plate, :string
    add_column :orders, :size, :string
    add_column :orders, :etc, :text
  end
end
