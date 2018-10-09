class Space < ApplicationRecord
  belongs_to :host
  belongs_to :equipment_info, dependent: :destroy
  belongs_to :basic_info, dependent: :destroy
  belongs_to :description, dependent: :destroy
  belongs_to :plan, dependent: :destroy
  has_many   :images, dependent: :destroy
  has_many   :likes, dependent: :destroy
  has_many   :reservations, dependent: :destroy
end
