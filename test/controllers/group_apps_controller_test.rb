require 'test_helper'

class GroupAppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_app = group_apps(:one)
  end

  test "should get index" do
    get group_apps_url
    assert_response :success
  end

  test "should get new" do
    get new_group_app_url
    assert_response :success
  end

  test "should create group_app" do
    assert_difference('GroupApp.count') do
      post group_apps_url, params: { group_app: { available: @group_app.available, body: @group_app.body, name: @group_app.name } }
    end

    assert_redirected_to group_app_url(GroupApp.last)
  end

  test "should show group_app" do
    get group_app_url(@group_app)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_app_url(@group_app)
    assert_response :success
  end

  test "should update group_app" do
    patch group_app_url(@group_app), params: { group_app: { available: @group_app.available, body: @group_app.body, name: @group_app.name } }
    assert_redirected_to group_app_url(@group_app)
  end

  test "should destroy group_app" do
    assert_difference('GroupApp.count', -1) do
      delete group_app_url(@group_app)
    end

    assert_redirected_to group_apps_url
  end
end
