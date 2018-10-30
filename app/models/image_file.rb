require 'file_size_validator'
class ImageFile < ApplicationRecord
  belongs_to :space_image, optional: true

  mount_uploader :file, ImageFileUploader

  validates :file, file_size: { maximum: 5.megabytes.to_i }

  enum status: %i(main sub)
end
