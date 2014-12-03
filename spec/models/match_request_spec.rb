require "rails_helper"

RSpec.describe MatchRequest, type: :model do
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }
  it { is_expected.to validate_presence_of(:request_message) }

  it { is_expected.to belong_to(:requester).class_name("User") }
  it { is_expected.to belong_to(:opponent).class_name("User") }
  it { is_expected.to have_many(:comments) }

  describe "#confirm!" do
    it "changes the attribute confirm to true" do
      match_request = build(:match_request)
      match_request.confirm!
      expect(match_request).to be_confirmed
    end
  end
end
