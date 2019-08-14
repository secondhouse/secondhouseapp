require 'test_helper'

class NotationControllerTest < ActionDispatch::IntegrationTest
  test "should get safe" do
    get notation_safe_url
    assert_response :success
  end

end
