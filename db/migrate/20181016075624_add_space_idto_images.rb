class AddSpaceIdtoImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :space, index: true
  end
end
