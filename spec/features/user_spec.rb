require 'rails_helper'

feature 'user', type: :feature do
  let(:user) { create(:user) }
  scenario 'sign up' do

    visit root_path
    expect(page).to have_no_content('ログアウト')

    visit new_user_registration_path
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    check   'user_accepted'
    find('input[name="commit"]').click
    expect(page).to have_content('ログアウト')
    expect(current_path).to eq root_path
  end
end
