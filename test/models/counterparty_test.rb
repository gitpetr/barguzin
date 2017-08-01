require 'test_helper'

class CounterpartyTest < ActiveSupport::TestCase
  def setup
    @counterparty = counterparties(:one)
  end

  test "should be valid" do
    assert @counterparty.valid?
  end

  test "name should be present" do
    @counterparty1 = Counterparty.create(comment: "lalala", groups_counterparty_id: 1)
    assert_not @counterparty1.valid?
  end


  test "Counterparty attributes name must not be empty" do
    @counterparty.name = ''
    assert @counterparty.invalid?
    assert @counterparty.errors[:name].any?
  end

  test "Counterparty attributes groups_counterparty_id must not be empty" do
    @counterparty.groups_counterparty_id = ''
    assert @counterparty.invalid?
    assert @counterparty.errors[:groups_counterparty_id].any?
  end

end
