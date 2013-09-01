require 'test_helper'

class CodeGeneratorsControllerTest < ActionController::TestCase
  test "should get generate" do
    get :generate
    assert_response :success
  end

end
