require "application_system_test_case"

class DrivingsTest < ApplicationSystemTestCase
  setup do
    @driving = drivings(:one)
  end

  test "visiting the index" do
    visit drivings_url
    assert_selector "h1", text: "Drivings"
  end

  test "creating a Driving" do
    visit drivings_url
    click_on "New Driving"

    fill_in "Instructor", with: @driving.instructor_id
    fill_in "Start Date", with: @driving.start_date
    fill_in "Student", with: @driving.student_id
    click_on "Create Driving"

    assert_text "Driving was successfully created"
    click_on "Back"
  end

  test "updating a Driving" do
    visit drivings_url
    click_on "Edit", match: :first

    fill_in "Instructor", with: @driving.instructor_id
    fill_in "Start Date", with: @driving.start_date
    fill_in "Student", with: @driving.student_id
    click_on "Update Driving"

    assert_text "Driving was successfully updated"
    click_on "Back"
  end

  test "destroying a Driving" do
    visit drivings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Driving was successfully destroyed"
  end
end
