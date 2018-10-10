class Plan < ApplicationRecord
  belongs_to :space
  belongs_to :rental_day, dependent: :destroy
  belongs_to :rental_hour, dependent: :destroy
end
