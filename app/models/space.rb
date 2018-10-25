class Space < ApplicationRecord
  belongs_to :user
  has_one  :equipment_info, dependent: :destroy
  has_one  :basic_info, dependent: :destroy
  has_one  :description, dependent: :destroy
  has_one  :plan, dependent: :destroy
  has_one  :space_image, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reservations, dependent: :destroy

  def self.search_party_spaces
    joins(basic_info: [:purpose]).where('party = ?', 1).order('likes_count DESC')
  end

  def self.search_meeting_spaces
    joins(basic_info: [:purpose]).where('meeting = ?', 1).order('likes_count DESC')
  end

  def self.search_photo_shoot_spaces
    joins(basic_info: [:purpose]).where('photo_shoot = ?', 1).order('likes_count DESC')
  end

  def self.search_film_shoot_spaces
    joins(basic_info: [:purpose]).where('film_shoot = ?', 1).order('likes_count DESC') 
  end

  def self.search_sports_spaces
    joins(basic_info: [:purpose]).where('sports = ?', 1).order('likes_count DESC')
  end
end
