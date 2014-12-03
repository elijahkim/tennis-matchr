require "rails_helper"

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:match_request) }
  it { is_expected.to delegate_method(:username).to(:user) }
end
