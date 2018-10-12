class CreateBasicInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :basic_infos do |t|
      t.integer     :capacity,                   null: false
      t.integer     :floor_space,                null: false
      t.integer     :date_of_starting_reception, null: false
      t.integer     :passig_key_method,          null: false
      t.integer     :deadline_of_reservation,    null: false
      t.references :purpose,              index: true
      t.timestamps
    end
  end
end
