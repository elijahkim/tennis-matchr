class ScoreValueCalculator
  attr_reader :players, :winner
  attr_accessor :scores

  def initialize(players, winner)
    @players = players
    @winner = winner
    @scores = []
  end

  def score_values
    if winner == players[0]
      scores[0] = 1
      scores[1] = 0
    elsif winner == players[1]
      scores[0] = 0
      scores[1] = 1
    elsif winner == "tie"
      scores[0] = 0.5
      scores[1] = 0.5
    end
    scores
  end
end
