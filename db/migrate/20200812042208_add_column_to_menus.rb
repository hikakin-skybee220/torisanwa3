class AddColumnToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :price, :string
    add_column :menus, :image_name, :string

  end
end
