require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get my_team" do
    get :my_team
    assert_response :success
  end

end
