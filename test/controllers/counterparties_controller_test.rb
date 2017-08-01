require 'test_helper'

class CounterpartiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @counterparty = counterparties(:one)
  end

  test "should get index" do
    get counterparties_url
    assert_response :success
  end

  test "should get new" do
    get new_counterparty_url
    assert_response :success
  end

  test "should create counterparty" do
    assert_difference('Counterparty.count') do
      @groups = GroupsCounterparty.create(name: "test")
      post counterparties_url, params: { counterparty: { name: "qwerty", groups_counterparty_id: @groups.id  } }
    end

    assert_redirected_to counterparties_url
  end

  test "should show counterparty" do
    get counterparty_url(@counterparty)
    assert_response :success
  end

  test "should get edit" do
    get edit_counterparty_url(@counterparty)
    assert_response :success
  end

  test "should update counterparty" do
    patch counterparty_url(@counterparty), params: { counterparty: { name: 'omega' } }
    assert_redirected_to counterparties_url
  end

  test "should destroy counterparty" do
    assert_difference('Counterparty.count', -1) do
      delete counterparty_url(@counterparty)
    end

    assert_redirected_to counterparties_url
  end
end
