class Reservation < ApplicationRecord
  belongs_to :user
  has_one :reservation_hour, dependent: :destroy
  belongs_to :space
end
