require 'test_helper'

class GoodTest < ActiveSupport::TestCase
  def setup
    @good = goods(:one)
  end

  test "should be valid" do
    assert @good.valid?
  end

  test "name should be present" do
    @good1 = Good.create(comment: "lalala")
    assert_not @good1.valid?
  end


  test "good attributes name must not be empty" do
    good = Good.new
    assert good.invalid?
    assert good.errors[:name].any?
  end
end
