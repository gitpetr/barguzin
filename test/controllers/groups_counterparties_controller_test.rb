require 'test_helper'

class GroupsCounterpartiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groups_counterparty = groups_counterparties(:one)
  end

  test "should get index" do
    get groups_counterparties_url
    assert_response :success
  end

  test "should get new" do
    get new_groups_counterparty_url
    assert_response :success
  end

  test "should create groups_counterparty" do
    assert_difference('GroupsCounterparty.count') do
      post groups_counterparties_url, params: { groups_counterparty: { name: 'seno' } }
    end

    assert_redirected_to groups_counterparties_url
  end

  test "should show groups_counterparty" do
    get groups_counterparty_url(@groups_counterparty)
    assert_response :success
  end

  test "should get edit" do
    get edit_groups_counterparty_url(@groups_counterparty)
    assert_response :success
  end

  test "should update groups_counterparty" do
    patch groups_counterparty_url(@groups_counterparty), params: { groups_counterparty: { name: 'soup' } }
    assert_redirected_to groups_counterparties_url
  end

  test "should destroy groups_counterparty" do
    assert_difference('GroupsCounterparty.count', -1) do
      delete groups_counterparty_url(@groups_counterparty)
    end

    assert_redirected_to groups_counterparties_url
  end
end
