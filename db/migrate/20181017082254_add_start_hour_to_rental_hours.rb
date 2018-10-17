class AddStartHourToRentalHours < ActiveRecord::Migration[5.0]
  def change
    add_column :rental_hours, :start_hour, :integer, null: false
    add_column :rental_hours, :end_hour, :integer, null: false
  end
end
