require 'rails_helper'

feature 'Siging in', %q{
  As an user
  I want be able to sign in
 } do

  given(:user) { create(:user) }

  scenario "Existing user try to sign in" do
    sign_in(user)
    # visit new_user_session_path
    # fill_in 'Логин', with: user.email
    # fill_in 'Пароль', with: user.password # '123456'
    # click_on 'Вход', class: 'btn btn-primary'
    #
    expect(page).to have_content 'Ваш интернет магазин'
    expect(current_path).to eq root_path
  end

  scenario 'Non-existing user try to sign in' do
    visit new_user_session_path
    fill_in 'Логин', with: 'user1@test.com'
    fill_in 'Пароль', with: '1234567'
    # save_and_open_page
    click_on 'Вход', class: 'btn btn-primary'
    expect(page).to have_content "Забыли пароль?"
  end
end

