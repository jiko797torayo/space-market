class Image < ApplicationRecord
  belongs_to :space

  mount_uploaders :photos, PhotoUploader

  validates :files, presence: true
  validates :about_image, presence: true
end
