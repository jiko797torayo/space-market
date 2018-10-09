class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :reservation_hours, dependent: :destroy
  belongs_to :space
end
