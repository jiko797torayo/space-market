class Space < ApplicationRecord
  belongs_to :host
  has_one :equipment_info, dependent: :destroy
  has_one :basic_info, dependent: :destroy
  has_one :description, dependent: :destroy
  has_one :plan, dependent: :destroy
  has_one :image, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
