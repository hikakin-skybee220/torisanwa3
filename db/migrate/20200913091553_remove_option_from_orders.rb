class RemoveOptionFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :option
  end
end
