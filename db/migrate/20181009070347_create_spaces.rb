class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.integer    :likes_count, default: 0
      t.references :host, index: true, foreign_key: true
      t.references :equipment_info, index: true, foreign_key: true
      t.references :basic_info, index: true, foreign_key: true
      t.references :description, index: true, foreign_key: true
      t.references :plan, index: true, foreign_key: true
      t.references :image, index: true, foreign_key: true
      t.timestamps
    end
  end
end
