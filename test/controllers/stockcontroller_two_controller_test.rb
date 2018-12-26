require 'test_helper'

class StockcontrollerTwoControllerTest < ActionDispatch::IntegrationTest
  test "should get history" do
    get stockcontroller_two_history_url
    assert_response :success
  end

  test "should get report" do
    get stockcontroller_two_report_url
    assert_response :success
  end

end
