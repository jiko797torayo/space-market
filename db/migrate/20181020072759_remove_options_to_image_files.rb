class RemoveOptionsToImageFiles < ActiveRecord::Migration[5.0]
  def up
    change_column :image_files, :file, :text
    change_column :image_files, :about_file, :text
    change_column :image_files, :status, :integer
  end

  def down
    change_column :image_files, :file, :text, null: false
    change_column :image_files, :about_file, :text, null: false
    change_column :image_files, :status, :integer, null: false
  end
end
