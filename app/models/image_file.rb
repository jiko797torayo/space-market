class ImageFile < ApplicationRecord
  belongs_to :space_image, optional: true

  mount_uploader :file, ImageFileUploader

  enum status: %i(main sub)
end
