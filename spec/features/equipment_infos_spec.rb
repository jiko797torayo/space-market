require 'rails_helper'

feature 'equipment_info', type: :feature do
  let(:user) { create(:user) }
  let(:equipment_info) { create(:equipment_info) }

  before do
    # ログイン前には「空きスペースを掲載する」ボタンが無い
    visit root_path
    expect(page).to have_no_content('空きスペースを掲載する')

    # ログイン
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(page).to have_content('ログアウト')
    expect(current_path).to eq root_path

    # フォームの入力
    visit root_path
    click_on '空きスペースを掲載する'
    expect(current_path).to eq new_equipment_info_path
    fill_in 'postal_code', with: equipment_info.postal_code
    select equipment_info.prefecture, from: 'prefecture'
    fill_in 'city_name', with: equipment_info.city_name
    fill_in 'street_name', with: equipment_info.street_name
    fill_in 'equipment_info_latitude', with: equipment_info.latitude
    fill_in 'equipment_info_longitude', with: equipment_info.longitude
    fill_in 'equipment_info_access', with: equipment_info.access
    fill_in 'equipment_info_phone_number', with: equipment_info.phone_number
    choose equipment_info.equipment_type
    expect(page).to have_button '保存して進む'
    expect(page).to have_button '保存して戻る'
  end

  context 'when click 保存して進む' do
    scenario 'create equipment_info and redirect to basic_info_path' do
      expect { click_button '保存して進む' }.to change(Space, :count).by(1).and change(EquipmentInfo, :count).by(1)
      expect(current_path).to eq new_basic_info_path
    end
  end

  context 'when click 保存して戻る' do
    scenario 'create equipment_info and redirect to edit_space_path' do
      expect { click_button '保存して戻る' }.to change(Space, :count).by(1).and change(EquipmentInfo, :count).by(1)
      expect(current_path).to eq edit_space_path(Space.last.id)
    end
  end
end
