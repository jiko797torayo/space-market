class AddPlanIdToRentalDays < ActiveRecord::Migration[5.0]
  def change
    add_reference :rental_days, :plan, index: true
  end
end
