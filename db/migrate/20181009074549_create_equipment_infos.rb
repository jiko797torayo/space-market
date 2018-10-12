class CreateEquipmentInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment_infos do |t|
      t.integer :postal_code,     null: false
      t.integer :prefecture,      null: false
      t.integer :city_name,       null: false
      t.integer :street_name,     null: false
      t.integer :building_name,   null: false
      t.integer :latitude,        null: false
      t.integer :longitude,       null: false
      t.integer :access,          null: false
      t.integer :phone_number,    null: false
      t.integer :equipment_type,  null: false
      t.timestamps
    end
  end
end
