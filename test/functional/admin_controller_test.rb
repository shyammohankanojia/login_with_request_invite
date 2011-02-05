require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get user_list" do
    get :user_list
    assert_response :success
  end

  test "should get active_user" do
    get :active_user
    assert_response :success
  end

end
