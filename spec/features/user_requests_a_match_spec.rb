require "rails_helper"

RSpec.feature "user requests a match" do
  scenario "a user requests a match with another user" do
    user = create(:user)
    opponent = create(:user)
    sign_in(user)
    requested_message = <<-EOSTRING
#{user.username} (#{user.elo}) would like to have a match with
#{opponent.username} (#{opponent.elo})
    EOSTRING

    visit user_path(opponent)
    click_link "Request a match with #{opponent.username}"
    fill_in "Write a message", with: "Hey, let's have a match"
    fill_in "Match at", with: "2015-01-24 19:12:16"
    click_button "Create Match request"

    expect(page).to have_content requested_message
  end
end
