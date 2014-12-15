require "rails_helper"

RSpec.describe Match, type: :model do
  it { is_expected.to belong_to(:challenger).class_name("User") }
  it { is_expected.to belong_to(:defender).class_name("User") }
end
