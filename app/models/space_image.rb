class SpaceImage < ApplicationRecord
  belongs_to :space
  has_many :image_files, dependent: :destroy

  accepts_nested_attributes_for :image_files, reject_if: :reject_sub_images

  def reject_sub_images(attributed)
    attributed['file'].blank?
  end
end
