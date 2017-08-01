require 'test_helper'

class GroupsCounterpartyTest < ActiveSupport::TestCase
  def setup
    @groups = groups_counterparties(:one)
  end

  test "should be valid" do
    assert @groups.valid?
  end

  test "name should be present" do
    @groups1 = GroupsCounterparty.create(comment: "lalala")
    assert_not @groups1.valid?
  end


  test "GroupsCounterparty attributes name must not be empty" do
    @groups2 = GroupsCounterparty.new
    assert @groups2.invalid?
    assert @groups2.errors[:name].any?
  end
end
