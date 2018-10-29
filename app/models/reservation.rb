class Reservation < ApplicationRecord
  belongs_to :user
  has_one :reservation_hour, dependent: :destroy
  belongs_to :space


  validates :day, uniqueness: {scope: :space_id}, presence: true, day_validation: true
end

