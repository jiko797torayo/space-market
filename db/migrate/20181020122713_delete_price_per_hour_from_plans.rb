class DeletePricePerHourFromPlans < ActiveRecord::Migration[5.0]
  def change
    remove_column :plans, :price_per_hour, index: true
  end
end
