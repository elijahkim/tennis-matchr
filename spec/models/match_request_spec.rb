require "rails_helper"

RSpec.describe MatchRequest, type: :model do
  it { is_expected.to validate_presence_of(:request_message) }
  it { is_expected.to validate_presence_of(:opponent) }
  it { is_expected.to validate_presence_of(:requester) }

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

  describe ".pending" do
    it "returns all match requests that have not been accepted" do
      match_request_one = build(:match_request)
      match_request_one.confirm!

      match_request_two = build(:match_request)

      expect(pending).to eq(match_request_two)
    end
  end

  describe "#get_comments" do
    it "returns all the Match Requests comments" do
      pending("Not sure how to test")
    end
  end

  describe "#player?(user)" do
    it "checks to see if a user is a requester or opponent" do
      pending("Not sure how to test")
    end
  end
end
