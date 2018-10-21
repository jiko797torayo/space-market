class Description < ApplicationRecord
  belongs_to :space

  validates :catch_copy,       catch_copy_validation: true
  validates :overview,         overview_validation: true
  validates :about_facilities, about_facilities_validation: true
end
