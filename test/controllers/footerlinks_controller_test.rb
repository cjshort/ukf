require 'test_helper'

class FooterlinksControllerTest < ActionController::TestCase
  test "should get editlisting" do
    get :editlisting
    assert_response :success
  end

  test "should get franchisorinfo" do
    get :franchisorinfo
    assert_response :success
  end

  test "should get aboutus" do
    get :aboutus
    assert_response :success
  end

  test "should get contactus" do
    get :contactus
    assert_response :success
  end

  test "should get toc" do
    get :toc
    assert_response :success
  end

end
