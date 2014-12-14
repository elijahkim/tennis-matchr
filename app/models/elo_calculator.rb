class EloCalculator
  attr_reader :result, :players, :challenger

  K_FACTOR = 32

  def initialize(challenger, opponent, result)
    @result = result
    @players = [challenger, opponent]
    @challenger = challenger
    set_data!(players, result)
  end

  def results
    calculate_elo(challenger)
  end

  private

  def set_data!(players, result)
    set_transformed_ratings!(players)
    set_expected_scores!(players)
    set_score_values!(players, result)
  end

  def calculate_elo(player)
    player.elo + (K_FACTOR * (player.score_value - player.expected_score))
  end

  def set_transformed_ratings!(players)
    players.each do |player|
      player.transformed_rating = transformed_rating(player)
    end
  end

  def set_expected_scores!(players)
    expected_scores(players).each_with_index do |score, index|
      players[index].expected_score = score
    end
  end

  def set_score_values!(players, result)
    score_values(players, result).each_with_index do |score, index|
      players[index].score_value = score
    end
  end

  def transformed_rating(player)
    TransformedRatingCalculator.new(player).results
  end

  def expected_scores(players)
    ExpectedScoreCalculator.new(players).results
  end

  def score_values(players, result)
    ScoreValueCalculator.new(players, result).results
  end
end
