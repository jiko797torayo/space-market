class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :reservations, dependent: :destroy
  has_many :likes, dependent: :destroy

  # validates :first_name, presence: true
  validate :first_name_validates
  validate :last_name_validates
  validate :email_validates
  validate :password_validates
  validate :password_confirmation_validates

  def first_name_validates
    if first_name.blank?
      errors.add(:first_name, "名を入力してください。")
    end
  end

  def last_name_validates
    if last_name.blank?
      errors.add(:last_name, "姓を入力してください。")
    end
  end

  def email_validates
    if email.blank?
      errors.add(:email, "メールアドレスを入力してください。")
    elsif email !~ /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
      errors.add(:email, "メールアドレスは不正な値です。")
    end
  end

  def password_validates
    if password.blank?
      errors.add(:password, "パスワードを入力してください。")
    elsif password.length < 8
      errors.add(:password, "パスワードは8文字以上で入力してください。")
    elsif password.length > 128
      errors.add(:password, "パスワードは128文字以内で入力してください。")
    end
  end

  def password_confirmation_validates
    if password_confirmation != password
      errors.add(:password_confirmation, "パスワード（確認）とパスワードの入力が一致しません。")
    end
  end
end
