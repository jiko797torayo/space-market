class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :day,  null: false
      t.references :reservation_user, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :space, index: true, foreign_key: true
      t.timestamps  null: false
    end
  end
end
