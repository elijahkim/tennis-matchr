class ExpectedScoreCalculator
  attr_reader :t_ratings

  def initialize(t_ratings)
    @t_ratings = t_ratings
  end

  def calculate_expected_scores
    t_ratings.map do |t_rating|
      t_rating / combined_t_ratings
    end
  end

  private

  def combined_t_ratings
    t_ratings.reduce(:+)
  end
end
