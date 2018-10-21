class AddSpaceIdToDescriptions < ActiveRecord::Migration[5.0]
  def change
    add_reference :descriptions, :space, index: true
  end
end
