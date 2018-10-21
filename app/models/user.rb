class User < ApplicationRecord
  devise   :database_authenticatable, :registerable, :recoverable, :rememberable

  has_many :reservations, dependent: :destroy
  has_many :likes,        dependent: :destroy
  has_many :spaces,       dependent: :destroy

  mount_uploader :icon, IconUploader

  validates :first_name,            first_name_validation: true
  validates :last_name,             last_name_validation: true
  validates :email,                 email_validation: true
  validates :password,              password_validation: true
  validates :accepted,              accepted_validation: true
  validate  :password_confirmation_validates
end

def password_confirmation_validates
  if password_confirmation != password
    errors.add(:password_confirmation, 'パスワード（確認）とパスワードの入力が一致しません。')
  end
end
