require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
   @user = User.create(username: 'qqq', email: 'qqq@qwe.wq', password: 111111, password_confirmation: 111111)
  end

  test "should be valid" do
   assert @user.valid?
  end

  test "username should be present" do
   @user1 = User.create(email: "Vasya@mail.ru", password: "foobar", password_confirmation: "foobar")
   assert_not @user1.valid?
  end

  test "email should be present" do
   @user1 = User.create(username: "Vasya", password: "foobar", password_confirmation: "foobar")
   assert_not @user1.valid?
  end

  test "name should not be too long" do
   @user1 = User.create(email: "Vasya@mail.ru", username: "#{'Vasya' * 51}", password: "foobar",
                        password_confirmation: "foobar")
   assert_not @user1.valid?
  end

  test "email addresses should be unique" do
    @user1 = User.create(username: 'qqqq', email: 'qqq@qwe.wq', password: 111111, password_confirmation: 111111)
    assert_not  @user1.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  #########################################################

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:username].any?
    assert user.errors[:password].any?
    assert user.errors[:email].any?
  end

  test "user is not valid without a unique email" do
    user = User.new(email: users(:user).email,
                          username: "yyyyy",
                          password: 111111,
                          password_confirmation: 111111)
    assert user.invalid?
    assert_equal ["has already been taken", "has already been taken"], user.errors[:email]
  end

  # test "user is not valid without a unique email - i18n" do
  #   user = User.new(email: users(:user).email,
  #                         username: "yyy",
  #                         password: 111111,
  #                   password_confirmation: 111111)
  #   assert user.invalid?
  #   assert_equal [I18n.translate('errors.messages.taken')], user.errors[:email]
  # end
end
