class ImageFile < ApplicationRecord
  belongs_to :space_image

  mount_uploader :file, ImageFileUploader

  enum status: %i(main sub)

  validates :file, presence: true
  validates :status, presence: true
end
