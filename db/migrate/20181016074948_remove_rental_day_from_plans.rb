class RemoveRentalDayFromPlans < ActiveRecord::Migration[5.0]
  def change
    remove_reference :plans, :rental_day, index: true
    remove_reference :plans, :rental_hour, index: true

    add_reference :plans, :space, index: true
  end
end
