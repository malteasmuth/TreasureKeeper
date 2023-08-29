require "test_helper"

class PlayerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get player_show_url
    assert_response :success
  end

  test "should get edit" do
    get player_edit_url
    assert_response :success
  end

  test "should get update" do
    get player_update_url
    assert_response :success
  end
end
