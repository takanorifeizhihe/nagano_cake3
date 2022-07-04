require "test_helper"

class Admin::OrderInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_order_infos_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_order_infos_update_url
    assert_response :success
  end
end
