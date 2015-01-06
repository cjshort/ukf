require 'test_helper'

class InsightsControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get leads" do
    get :leads
    assert_response :success
  end

  test "should get editlisting" do
    get :editlisting
    assert_response :success
  end

end
