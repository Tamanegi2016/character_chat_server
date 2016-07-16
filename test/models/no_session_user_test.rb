require 'test_helper'

class NoSessionUserTest < ActiveSupport::TestCase
  test "should be valid infomation" do
    user = no_session_user(:michael)
    assert_equal "Michael Example", user.name
   end
end
