class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.integer    :likes_count, default: 0
      t.references :host,           index: true
      t.references :equipment_info, index: true
      t.references :basic_info,     index: true
      t.references :description,    index: true
      t.references :plan,           index: true
      t.references :image,          index: true
      t.timestamps
    end
  end
end
