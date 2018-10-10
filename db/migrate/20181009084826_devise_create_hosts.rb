# frozen_string_literal: true

class DeviseCreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.string   :first_name,           null: false
      t.string   :last_name,            null: false
      t.string   :email,                null: false, unique: true
      t.integer  :phone_number,         null: false, unique: true
      t.string   :encrypted_password,   null: false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps
    end
  end
end
