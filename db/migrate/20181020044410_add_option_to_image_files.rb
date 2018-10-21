class AddOptionToImageFiles < ActiveRecord::Migration[5.0]
  def change
    change_column :image_files, :file, :text, null: false
    change_column :image_files, :about_file, :text, null: false
    change_column :image_files, :status, :integer, null: false
  end
end
