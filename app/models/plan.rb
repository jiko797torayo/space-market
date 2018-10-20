class Plan < ApplicationRecord
  belongs_to :space
  has_one :rental_day, dependent: :destroy
  has_one :rental_hour, dependent: :destroy

  accepts_nested_attributes_for :rental_day
  accepts_nested_attributes_for :rental_hour

  validates :name, plan_name_validation: true
  validates :price_per_day, price_validation: true
  validates :reservation_approval_method, reservation_approval_method_validation: true

  enum reservation_approval_method: {
    承認なし（今すぐ予約）:1, 承認あり:2
  }
end
