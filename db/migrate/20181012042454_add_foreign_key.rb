class AddForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :reservations, :reservation_hours
    add_foreign_key :reservations, :users
    add_foreign_key :reservations, :spaces
    add_foreign_key :likes, :users
    add_foreign_key :likes, :spaces
    add_foreign_key :spaces, :hosts
    add_foreign_key :spaces, :equipment_infos
    add_foreign_key :spaces, :basic_infos
    add_foreign_key :spaces, :descriptions
    add_foreign_key :spaces, :plans
    add_foreign_key :spaces, :images
    add_foreign_key :basic_infos, :purposes
    add_foreign_key :plans, :rental_days
    add_foreign_key :plans, :rental_hours
  end
end
