require "rails_helper"

feature "User sees Activity" do
  scenario "has activity" do
    sign_in("test1", "password")

    visit activity_feed_path
    expect(page). to have_css ".activity li"
  end

  scenario "does not have activity" do
    sign_in("test2", "password")

    visit activity_feed_path
    expect(page). to have_content("You don't have any activity")
  end
end
