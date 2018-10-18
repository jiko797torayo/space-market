class SpaceImage < ApplicationRecord
  belongs_to :space
  has_many :image_files, dependent: :destroy

  accepts_nested_attributes_for :image_files
end
