class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user,  index: true
      t.references :space, index: true
      t.timestamps
    end
  end
end
