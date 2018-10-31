class Space < ApplicationRecord
  belongs_to :user
  has_one  :equipment_info, dependent: :destroy
  has_one  :basic_info, dependent: :destroy
  has_one  :description, dependent: :destroy
  has_one  :plan, dependent: :destroy
  has_one  :space_image, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :status, space_status_validation: true, on: :update

  scope :published, -> { where(published: true) }
  scope :party,  -> { joins(basic_info: [:purpose]).where('party = ?', 1) }
  scope :meeting, -> { joins(basic_info: [:purpose]).where('meeting = ?', 1) }
  scope :photo_shoot, -> { joins(basic_info: [:purpose]).where('photo_shoot = ?', 1) }
  scope :film_shoot, -> { joins(basic_info: [:purpose]).where('film_shoot = ?', 1) }
  scope :sports, -> { joins(basic_info: [:purpose]).where('sports = ?', 1) }
  scope :by_likes_count, -> { order('likes_count DESC') }
  enum status: %i(draft published)

  scope :prefecture_key, -> (params) { joins(:equipment_info).where('prefecture LIKE(?)', params) if params.present? }
  scope :price_min_key, -> (params) { joins(:plan).where('price_per_day >= ?', params) if params.present? }
  scope :price_max_key, -> (params) { joins(:plan).where('price_per_day <= ?', params) if params.present? }
  scope :capacity_key, -> (params) { joins(:basic_info).where('capacity >= ?', params) if params.present? }
  scope :approval_method_key, -> (params) { joins(:plan).where('reservation_approval_method = ?', params) if params.present? }
  scope :purpose_key, -> (params) { joins(basic_info: [:purpose]).where("#{params} = ?", 1) if params.present? }
end
