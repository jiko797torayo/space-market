class AddSpaceIdtoEquipmentInfos < ActiveRecord::Migration[5.0]
  def change
    add_reference :equipment_infos, :space, index: true
  end
end
