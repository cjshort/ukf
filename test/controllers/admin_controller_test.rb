require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get overview" do
    get :overview
    assert_response :success
  end

  test "should get listings" do
    get :listings
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

  test "should get moneyzone" do
    get :moneyzone
    assert_response :success
  end

end
