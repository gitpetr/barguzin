require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    @user = User.create(username: 'aq', password: 111111, password_confirmation: 111111, email: 'aq@a.a')
    get search_users_path, params: { username: 'aq'}
    assert_response :found
    follow_redirect!
    assert_select 'h1',  'aq'
  end
end
