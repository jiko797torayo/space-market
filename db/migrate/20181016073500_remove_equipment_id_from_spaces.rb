class RemoveEquipmentIdFromSpaces < ActiveRecord::Migration[5.0]
  def change
    remove_reference :spaces, :equipment_info, index: true
    remove_reference :spaces, :basic_info, index: true
    remove_reference :spaces, :description, index: true
    remove_reference :spaces, :plan, index: true
    remove_reference :spaces, :image, index: true 
  end
end
