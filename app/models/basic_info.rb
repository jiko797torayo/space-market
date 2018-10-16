class BasicInfo < ApplicationRecord
  belongs_to :space
  has_one :purpose, dependent: :destroy
  accepts_nested_attributes_for :purpose

  validates :capacity, presence: true
  validates :floor_space, presence: true
  validates :start_of_reservation, presence: true
  validates :passig_key_method, presence: true
  validates :deadline_of_reservation, presence: true

  enum passig_key_method: {
    対面: 1, キーボックス: 2, スマートロック: 3, 予約成立後にメッセージで伝える: 4
  }
  enum deadline_of_reservation: {
    利用日当日: 0, 利用日の１日前: 1, 利用日の２日前: 2, 利用日の３日前: 3, 利用日の７日前: 7, 利用日の１４日前: 14 
  }
  enum start_of_reservation: {
    ３ヶ月先まで予約を受け付ける: 3, ６ヶ月先まで予約を受け付ける: 6, ９ヶ月先まで予約を受け付ける: 9, １２ヶ月先まで予約を受け付ける: 12 
  }
end
