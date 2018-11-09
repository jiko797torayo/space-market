require 'rails_helper'

describe EquipmentInfo do
  describe '#create' do
    context 'can save' do
      it 'is valid with all items' do
        expect(build(:equipment_info)).to be_valid
      end

      it 'is valid without a building_name' do
        expect(build(:equipment_info, building_name: nil)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without a postal_code' do
        equipment_info = build(:equipment_info, postal_code: nil)
        equipment_info.valid?
        expect(equipment_info.errors[:postal_code]).to include('郵便番号を入力してください。')
      end

      it 'is invalid with a postal_code that has more than 7 digits' do
        equipment_info = build(:equipment_info, postal_code: '12345678')
        equipment_info.valid?
        expect(equipment_info.errors[:postal_code]).to include('郵便番号は不正な値です。')
      end

      it 'is invalid with a postal_code that has less than 7 digits' do
        equipment_info = build(:equipment_info, postal_code: '123456')
        equipment_info.valid?
        expect(equipment_info.errors[:postal_code]).to include('郵便番号は不正な値です。')
      end

      it 'is invalid without a prefecture' do
        equipment_info = build(:equipment_info, prefecture: nil)
        equipment_info.valid?
        expect(equipment_info.errors[:prefecture]).to include('都道府県を入力してください。')
      end

      it 'is invalid without a city_name' do
        equipment_info = build(:equipment_info, city_name: nil)
        equipment_info.valid?
        expect(equipment_info.errors[:city_name]).to include('市区町村を入力してください。')
      end

      it 'is invalid without a street_name' do
        equipment_info = build(:equipment_info, street_name: nil)
        equipment_info.valid?
        expect(equipment_info.errors[:street_name]).to include('町名・番地を入力してください。')
      end

      it 'is invalid without a latitude' do
        expect(build(:equipment_info, latitude: nil)).not_to be_valid
      end

      it 'is invalid without a longitude' do
        expect(build(:equipment_info, longitude: nil)).not_to be_valid
      end

      it 'is invalid without an access' do
        equipment_info = build(:equipment_info, access: nil)
        equipment_info.valid?
        expect(equipment_info.errors[:access]).to include('アクセスを入力してください。')
      end

      it 'is invalid without a phone_number' do
        equipment_info = build(:equipment_info, phone_number: nil)
        equipment_info.valid?
        expect(equipment_info.errors[:phone_number]).to include('電話番号を入力してください。')
      end

      it 'is invalid with a phone_number that has less than 10 digits' do
        equipment_info = build(:equipment_info, phone_number: '012345678')
        equipment_info.valid?
        expect(equipment_info.errors[:phone_number]).to include('電話番号は不正な値です。')
      end

      it 'is invalid with a phone_number that has more than 11 digits' do
        equipment_info = build(:equipment_info, phone_number: '012345678901')
        equipment_info.valid?
        expect(equipment_info.errors[:phone_number]).to include('電話番号は不正な値です。')
      end

      it 'is invalid without an equipment_type' do
        equipment_info = build(:equipment_info, equipment_type: nil)
        equipment_info.valid?
        expect(equipment_info.errors[:equipment_type]).to include('施設の種類を入力してください。')
      end
    end
  end
end
