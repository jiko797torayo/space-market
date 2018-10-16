class Description < ApplicationRecord
  belongs_to :space

  validates :catch_copy,       presence: true, length: { maximum: 64 }
  validates :overview,         presence: true, length: { in: 10..800 }
  validates :about_facilities, presence: true, length: { in: 10..800 }
end
