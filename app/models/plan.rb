class Plan < ApplicationRecord
  belongs_to :space
  has_one :rental_day, dependent: :destroy
  has_one :rental_hour, dependent: :destroy
end
