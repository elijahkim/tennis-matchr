require "rails_helper"

RSpec.describe ExpectedScoreCalculator, type: :model do
  describe "#results" do
    it "returns the expected score" do
      expect(expected_score_calculator.results).to be_eql([0.5, 0.5])
    end
  end

  def expected_score_calculator
    winner = User.new(transformed_rating: 1000.0)
    loser = User.new(transformed_rating: 1000.0)
    players = [winner, loser]
    ExpectedScoreCalculator.new(players)
  end
end
