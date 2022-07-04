require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get addresses" do
    get items_addresses_url
    assert_response :success
  end

  test "should get cart_items" do
    get items_cart_items_url
    assert_response :success
  end

  test "should get order_infos" do
    get items_order_infos_url
    assert_response :success
  end
end
