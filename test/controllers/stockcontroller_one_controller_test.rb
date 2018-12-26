require 'test_helper'

class StockcontrollerOneControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stockcontroller_one_new_url
    assert_response :success
  end

  test "should get create" do
    get stockcontroller_one_create_url
    assert_response :success
  end

end
