require 'rails_helper'

describe User do
  describe '#new' do
    context 'can save' do
      it 'is valid with all' do
        expect(build(:user)).to be_valid
      end

      it 'is valid without icon' do
        expect(build(:user, icon: nil)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without first_name' do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include('名を入力してください。')
      end

      it 'is invalid without last_name' do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include('姓を入力してください。')
      end

      it 'is invalid without email' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('メールアドレスを入力してください。')
      end

      it 'is invalid with invalid email' do
        user = build(:user, email: "aaa")
        user.valid?
        expect(user.errors[:email]).to include('メールアドレスは不正な値です。')
      end

      it 'is invalid without password' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('パスワードを入力してください。')
      end

      it 'is invalid with a password that has less than 8 characters' do
        user = build(:user, password: '1234567', password_confirmation: '1234567')
        user.valid?
        expect(user.errors[:password]).to include('パスワードは8文字以上で入力してください。')
      end

      it 'is invalid with a password that has more than 128 characters' do
        user = build(:user, password: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', password_confirmation: '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789')
        user.valid?
        expect(user.errors[:password]).to include('パスワードは128文字以内で入力してください。')
      end

      it 'is invalid password and password_confirmation do not match' do
        user = build(:user, password: '123456789', password_confirmation: '123')
        user.valid?
        expect(user.errors[:password_confirmation]).to include('パスワード（確認）とパスワードの入力が一致しません。')
      end

      it 'is invalid do not accepted' do
        user = build(:user, accepted: "0")
        user.valid?
        expect(user.errors[:accepted]).to include('スペースマーケット利用規約を受諾してください。')
      end
    end
  end

end
