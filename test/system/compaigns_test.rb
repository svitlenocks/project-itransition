require "application_system_test_case"

class CompaignsTest < ApplicationSystemTestCase
  setup do
    @compaign = compaigns(:one)
  end

  test "visiting the index" do
    visit compaigns_url
    assert_selector "h1", text: "Compaigns"
  end

  test "creating a Compaign" do
    visit compaigns_url
    click_on "New Compaign"

    fill_in "Description", with: @compaign.description
    fill_in "Endtime", with: @compaign.endtime
    fill_in "Goal", with: @compaign.goal
    fill_in "Title", with: @compaign.title
    fill_in "User", with: @compaign.user_id
    fill_in "Video", with: @compaign.video
    click_on "Create Compaign"

    assert_text "Compaign was successfully created"
    click_on "Back"
  end

  test "updating a Compaign" do
    visit compaigns_url
    click_on "Edit", match: :first

    fill_in "Description", with: @compaign.description
    fill_in "Endtime", with: @compaign.endtime
    fill_in "Goal", with: @compaign.goal
    fill_in "Title", with: @compaign.title
    fill_in "User", with: @compaign.user_id
    fill_in "Video", with: @compaign.video
    click_on "Update Compaign"

    assert_text "Compaign was successfully updated"
    click_on "Back"
  end

  test "destroying a Compaign" do
    visit compaigns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Compaign was successfully destroyed"
  end
end
