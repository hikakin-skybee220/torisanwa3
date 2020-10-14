class RemoveOptionFromDecisions < ActiveRecord::Migration[6.0]
  def change
    remove_column :decisions, :option
  end
end
