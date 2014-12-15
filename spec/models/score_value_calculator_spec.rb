require "rails_helper"

RSpec.describe ScoreValueCalculator, type: :model do
  describe "#results" do
    it "returns [1, 0] when given true" do
      expect(true_score_value_calculator.results).to be_eql([1, 0])
    end

    it "returns [0, 1] when given false" do
      expect(false_score_value_calculator.results).to be_eql([0, 1])
    end
  end

  def true_score_value_calculator
    ScoreValueCalculator.new(true)
  end

  def false_score_value_calculator
    ScoreValueCalculator.new(false)
  end
end
