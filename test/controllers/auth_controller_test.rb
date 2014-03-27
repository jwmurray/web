require 'test_helper'

class AuthControllerTest < ActionController::TestCase
  test "should get token" do
    get :token
    assert_response :success
  end

end
