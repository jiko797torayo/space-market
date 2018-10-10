class CreatePurposes < ActiveRecord::Migration[5.0]
  def change
    create_table :purposes do |t|
      t.integer :party,       null: false
      t.integer :class,       null: false
      t.integer :photo_shoot, null: false
      t.integer :film_shoot,  null: false
      t.integer :event,       null: false
      t.integer :performance, null: false
      t.integer :studio,      null: false
      t.integer :sports,      null: false
      t.integer :office,      null: false
      t.integer :wedding,     null: false
      t.integer :other,       null: false
      t.timestamps
    end
  end
end
