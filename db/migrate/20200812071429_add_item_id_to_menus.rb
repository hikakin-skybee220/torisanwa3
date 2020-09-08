class AddItemIdToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :item_id, :integer
  end
end
