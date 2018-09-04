require "application_system_test_case"

class GroupAppsTest < ApplicationSystemTestCase
  setup do
    @group_app = group_apps(:one)
  end

  test "visiting the index" do
    visit group_apps_url
    assert_selector "h1", text: "Group Apps"
  end

  test "creating a Group app" do
    visit group_apps_url
    click_on "New Group App"

    fill_in "Available", with: @group_app.available
    fill_in "Body", with: @group_app.body
    fill_in "Name", with: @group_app.name
    click_on "Create Group app"

    assert_text "Group app was successfully created"
    click_on "Back"
  end

  test "updating a Group app" do
    visit group_apps_url
    click_on "Edit", match: :first

    fill_in "Available", with: @group_app.available
    fill_in "Body", with: @group_app.body
    fill_in "Name", with: @group_app.name
    click_on "Update Group app"

    assert_text "Group app was successfully updated"
    click_on "Back"
  end

  test "destroying a Group app" do
    visit group_apps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group app was successfully destroyed"
  end
end
