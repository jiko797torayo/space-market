class CreateRentalDays < ActiveRecord::Migration[5.0]
  def change
    create_table :rental_days do |t|
      t.integer :sunday,    null: false
      t.integer :monday,    null: false
      t.integer :tuesday,   null: false
      t.integer :wednesday, null: false
      t.integer :thursday,  null: false
      t.integer :friday,    null: false
      t.integer :saturday,  null: false
      t.timestamps
    end
  end
end
