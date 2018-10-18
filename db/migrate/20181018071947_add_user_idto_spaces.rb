class AddUserIdtoSpaces < ActiveRecord::Migration[5.0]
  def change
    remove_reference :spaces, :host, index: true

    add_reference :spaces, :user, index: true
  end
end
