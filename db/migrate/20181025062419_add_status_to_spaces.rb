class AddStatusToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :status, :integer, default: 0, null: false
  end
end
