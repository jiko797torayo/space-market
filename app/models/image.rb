class Image < ApplicationRecord
  belongs_to :space

  mount_uploader :uri, PhotoUploader

  validates :uri, presence: true
  validates :about_image, presence: true
end
