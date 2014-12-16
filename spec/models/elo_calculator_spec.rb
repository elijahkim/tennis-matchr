require "rails_helper"

RSpec.describe EloCalculator, type: :model do
  before(:each) do
    @winner = User.new(
      elo: 1400,
      score_value: 1,
      expected_score: 0.5
    )
    @loser = User.new(
      elo: 1400,
      score_value: 0,
      expected_score: 0.5
    )
    @elo_calculator = EloCalculator.new(@winner, @loser, true)
  end

  describe "#results" do
    it "returns the new elo of the challenger" do
      expect(@elo_calculator.results).to be_eql(1416.0)
    end
  end
end
