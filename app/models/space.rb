class Space < ApplicationRecord
  belongs_to :user
  has_one  :equipment_info, dependent: :destroy
  has_one  :basic_info, dependent: :destroy
  has_one  :description, dependent: :destroy
  has_one  :plan, dependent: :destroy
  has_one  :space_image, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reservations, dependent: :destroy

  scope :party,  -> { joins(basic_info: [:purpose]).where('party = ?', 1) }
  scope :meeting, -> { joins(basic_info: [:purpose]).where('meeting = ?', 1) }
  scope :photo_shoot, -> { joins(basic_info: [:purpose]).where('photo_shoot = ?', 1) }
  scope :film_shoot, -> { joins(basic_info: [:purpose]).where('film_shoot = ?', 1) }
  scope :sports, -> { joins(basic_info: [:purpose]).where('sports = ?', 1) }
  scope :by_likes_count, -> { order('likes_count DESC') }
end
