class ChangeDataPostalCodeToEquipmentInfos < ActiveRecord::Migration[5.0]
  def change
    change_column :equipment_infos, :postal_code, :string
  end
end
