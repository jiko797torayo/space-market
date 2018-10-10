class CreateDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptions do |t|
      t.string :catch_copy,       null: false
      t.text   :overview,         null: false
      t.text   :about_facilities, null: false
      t.timestamps
    end
  end
end
