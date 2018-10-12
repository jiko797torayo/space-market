class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :day,  null: false
      t.references :reservation_hour, index: true
      t.references :user,             index: true
      t.references :space,            index: true
      t.timestamps
    end
  end
end
