class RentalDay < ApplicationRecord
  belongs_to :plan

  validates :sunday, presence: true
  validates :monday, presence: true
  validates :tuesday, presence: true
  validates :wednesday, presence: true
  validates :thursday, presence: true
  validates :friday, presence: true
end
