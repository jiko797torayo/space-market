class RentalHour < ApplicationRecord
  belongs_to :plan

  validates :start_hour, presence: true
  validates :end_hour, presence: true
end
