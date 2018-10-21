class CreateBasicInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :basic_infos do |t|
      t.integer     :capacity,                null: false
      t.integer     :floor_space,             null: false
      t.integer     :starting_of_reservation, null: false
      t.integer     :passig_key_method,       null: false
      t.integer     :deadline_of_reservation, null: false
      t.timestamps
    end
  end
end
