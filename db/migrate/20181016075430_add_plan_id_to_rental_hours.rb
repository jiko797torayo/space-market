class AddPlanIdToRentalHours < ActiveRecord::Migration[5.0]
  def change
    add_reference :rental_hours, :plan, index: true
  end
end
