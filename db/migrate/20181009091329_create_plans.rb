class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string     :name,                        null: false
      t.text       :about_plan,                  null: false
      t.integer    :price_per_hour,              null: false
      t.integer    :price_per_day,               null: false
      t.integer    :reservation_approval_method, null: false
      t.references :rental_day,            index: true, foreign_key: true
      t.references :rental_hour,           index: true, foreign_key: true
      t.timestamps
    end
  end
end
