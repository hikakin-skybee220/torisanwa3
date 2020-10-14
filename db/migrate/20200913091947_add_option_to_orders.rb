class AddOptionToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :shichimi, :string
    add_column :orders, :yuzu_pepper, :string
    add_column :orders, :lemon, :string
  end
end
