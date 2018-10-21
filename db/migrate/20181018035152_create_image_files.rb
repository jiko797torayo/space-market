class CreateImageFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :image_files do |t|
      t.text :file
      t.text :about_file
      t.integer :status
      t.references :space_image
      t.timestamps
    end
  end
end
