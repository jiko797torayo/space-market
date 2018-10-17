class Purpose < ApplicationRecord
  belongs_to :basic_info, optional: true

  validates :party, presence: true
  validates :meeting, presence: true
  validates :photo_shoot, presence: true
  validates :film_shoot, presence: true
  validates :event, presence: true
  validates :performance, presence: true
  validates :studio, presence: true   
  validates :sports, presence: true
  validates :office, presence: true
  validates :wedding, presence: true
  validates :other, presence: true
end
