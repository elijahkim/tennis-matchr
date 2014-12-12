class ExpectedScoreCalculator
  attr_reader :transformed_ratings

  def initialize(players)
    @transformed_ratings = get_transformed_ratings(players)
  end

  def results
    transformed_ratings.map do |transformed_rating|
      transformed_rating / combined_transformed_ratings(transformed_ratings)
    end
  end

  private

  def combined_transformed_ratings(transformed_ratings)
    transformed_ratings.reduce(:+)
  end

  def get_transformed_ratings(players)
    players.map { |player| player.transformed_rating }
  end
end
