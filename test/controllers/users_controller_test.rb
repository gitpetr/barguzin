require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user =  User.create(username: 'we', password: 111111, password_confirmation: 111111, email: 'we@a.a')
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { username: 'z', password: 111111, password_confirmation: 111111, email: 'z@a.a' } }
    end

    assert_redirected_to root_url
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { username: 'aaa', password: 111111, password_confirmation: 111111, email: 'aaa@a.a' } }
    assert_redirected_to users_url
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
