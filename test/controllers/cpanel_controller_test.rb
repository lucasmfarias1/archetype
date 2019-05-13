require 'test_helper'

class CpanelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cpanel_index_url
    assert_response :success
  end

  test "should get heroes" do
    get cpanel_heroes_url
    assert_response :success
  end

  test "should get users" do
    get cpanel_users_url
    assert_response :success
  end

end
