require "rails_helper"

RSpec.describe TransformedRatingCalculator, type: :model do
  describe "#results" do
    it "returns the Transformed Rating" do
      expect(transformed_rating_calculator.results).to be_within(1).of(3162)
    end
  end

  def transformed_rating_calculator
    player = User.new(elo: 1400)
    TransformedRatingCalculator.new(player)
  end
end
