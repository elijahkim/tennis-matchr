class EloCalculator
  attr_reader :winner, :players
  attr_accessor :expected_scores, :scores, :new_elos

  K_FACTOR = 32

  def initialize(player1, player2, winner)
    @winner = winner
    @players = [player1, player2]
    @expected_scores = []
    @scores = []
    @new_elos = []
  end

  def calculate_elo
    get_data
    players.map.with_index do |player, index|
      calculate_new_elo(player.elo, scores[index], expected_scores[index])
    end
  end

  private

  def get_data
    t_rating_calculator = TransformedRatingCalculator.new(players)
    t_ratings = t_rating_calculator.calculate_transformed_ratings

    expected_score_calculator = ExpectedScoreCalculator.new(t_ratings)
    self.expected_scores = expected_score_calculator.calculate_expected_scores

    score_calculator = ScoreValueCalculator.new(players, winner)
    self.scores = score_calculator.score_values
  end

  def calculate_new_elo(elo, score, expected_score)
    elo + (K_FACTOR * (score - expected_score))
  end
end
