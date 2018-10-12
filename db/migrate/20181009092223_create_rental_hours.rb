class CreateRentalHours < ActiveRecord::Migration[5.0]
  def change
    create_table :rental_hours do |t|
      t.integer :zero,          null: false, default: 0
      t.integer :one,           null: false, default: 0
      t.integer :two,           null: false, default: 0
      t.integer :three,         null: false, default: 0
      t.integer :four,          null: false, default: 0
      t.integer :five,          null: false, default: 0
      t.integer :six,           null: false, default: 0
      t.integer :seven,         null: false, default: 0
      t.integer :eight,         null: false, default: 0
      t.integer :nine,          null: false, default: 0
      t.integer :ten,           null: false, default: 0
      t.integer :eleven,        null: false, default: 0
      t.integer :twelve,        null: false, default: 0
      t.integer :thirteen,      null: false, default: 0
      t.integer :fourteen,      null: false, default: 0
      t.integer :fifteen,       null: false, default: 0
      t.integer :sixteen,       null: false, default: 0
      t.integer :seventeen,     null: false, default: 0
      t.integer :eighteen,      null: false, default: 0
      t.integer :nineteen,      null: false, default: 0
      t.integer :twenty,        null: false, default: 0
      t.integer :twenty_one,    null: false, default: 0
      t.integer :twenty_two,    null: false, default: 0
      t.integer :twenty_three,  null: false, default: 0
      t.timestamps
    end
  end
end
