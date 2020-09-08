class CreateDecisions < ActiveRecord::Migration[6.0]
  def change
    create_table :decisions do |t|
      t.string :seat_number
      t.string :name
      t.string :small_plate
      t.string :size
      t.string :quantity
      t.text :etc

      t.timestamps
    end
  end
end
