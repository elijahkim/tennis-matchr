class TransformedRatingCalculator
  attr_reader :players
  attr_accessor :t_ratings

  def initialize(players)
    @players = players
  end

  def calculate_transformed_ratings
    players.map do |player|
      t_rating_calculation(player.elo)
    end
  end

  private

  def t_rating_calculation(elo)
    (10**(elo / 400)).to_f
  end
end
