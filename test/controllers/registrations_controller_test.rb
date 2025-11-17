require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get choose_type" do
    get registrations_choose_type_url
    assert_response :success
  end
end
