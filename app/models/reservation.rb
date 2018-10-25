class Reservation < ApplicationRecord
  belongs_to :user
  has_one :reservation_hour, dependent: :destroy
  belongs_to :space

  validates :user_id,    presence: true
  validates :space_id,   presence: true
  validates :day,        presence: true
end

