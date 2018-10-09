class BasicInfo < ApplicationRecord
  belongs_to :space
  belongs_to :purpose, dependent: :destroy
end
