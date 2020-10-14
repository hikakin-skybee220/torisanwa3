class Value < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :value, :integer
  end
end
