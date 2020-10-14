class AddOptionToDecisions < ActiveRecord::Migration[6.0]
  def change
    add_column :decisions, :option, :text
  end
end
