class CreateSpaceImages < ActiveRecord::Migration[5.0]
  def change
    create_table :space_images do |t|
      t.references :space, index: true
      t.timestamps
    end
  end
end
