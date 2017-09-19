module AcceptanceMacros
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Логин', with: user.email
    fill_in 'Пароль', with: user.password #'123456'
    click_on 'Вход', class: 'btn btn-primary'
  end
end