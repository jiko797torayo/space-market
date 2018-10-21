class ChangePrefectureToEquipmentinfos < ActiveRecord::Migration[5.0]
  def up
    change_table :equipment_infos do |t|
      t.change :city_name, :string, null: false
      t.change :street_name, :text, null: false
      t.change :building_name, :text
      t.change :latitude, :float, null: false
      t.change :longitude, :float, null: false
      t.change :access, :text, null: false
      t.change :phone_number, :string, null: false
    end
  end

  def down
    change_table :equipment_infos do |t|
      t.change :city_name, :integer, null: false
      t.change :street_name, :integer, null: false
      t.change :building_name, :integer, null: false
      t.change :latitude, :integer, null: false
      t.change :longitude, :integer, null: false
      t.change :access, :integer, null: false
      t.change :phone_number, :integer, null: false
    end
  end
end
