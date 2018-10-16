class Purpose < ApplicationRecord
  belongs_to :basic_info

  validates :party, precense: true
  validates :meeting, precense: true
  validates :photo_shoot, precense: true
  validates :film_shoot, precense: true
  validates :event, precense: true
  validates :performance, precense: true
  validates :studio, precense: true   
  validates :sports, precense: true
  validates :office, precense: true
  validates :wedding, precense: true
  validates :other, precense: true
  validates :basic_info, precense: true, uniqueness: true
end
