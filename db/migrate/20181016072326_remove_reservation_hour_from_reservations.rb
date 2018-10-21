class RemoveReservationHourFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :reservation_hour_id
  end
end
