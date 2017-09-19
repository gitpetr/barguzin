# require_relative 'acceptance_helper'
require 'rails_helper'

feature 'Create good', %q{
  As an authenticated user
  I want to be able to create good
} do

  given(:user) { create(:user) }

  scenario 'Authenticated user create the good' do
    sign_in(user)

    visit '/goods'
    # save_and_open_page
    click_on 'Новый'
    fill_in 'Название', with: 'Test good'
    fill_in 'Описание', with: 'text text text'
    click_on 'Сохранить'

    expect(page).to have_content 'Номенклатура'
  end

  scenario 'Non-authenticated user try to create good' do
    visit '/goods'
    expect(page.has_no_button?('Новый')).to be true
    visit '/goods/new'
    expect(page).to have_content 'Регистрация Забыли пароль?'
  end
end
