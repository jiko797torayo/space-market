class AddSpaceIdToBasicInfos < ActiveRecord::Migration[5.0]
  def change
    add_reference :basic_infos, :space, index: true
  end
end
