# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :email,              null: false, unique: true
      t.string :icon
      t.string :encrypted_password, null: false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end
  end
end
