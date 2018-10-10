class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :uri
      t.text   :about_image
      t.timestamps
    end
  end
end