class AddReservationIdToReservationHours < ActiveRecord::Migration[5.0]
  def change
    add_reference :reservation_hours, :reservation, index: true
  end
end
