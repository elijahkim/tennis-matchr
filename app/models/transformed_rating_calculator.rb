class TransformedRatingCalculator
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def results
    t_rating_calculation
  end

  private

  def t_rating_calculation
    (10**(player.elo.to_f / 400))
  end
end
