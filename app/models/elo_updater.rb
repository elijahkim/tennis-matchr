class EloUpdater
  attr_accessor :match

  def initialize(match)
    @match = match
  end

  def update_elo
    new_elos = get_new_elos
    match.defender.update(elo: new_elos[0])
    match.challenger.update(elo: new_elos[1])
  end

  private

  def get_new_elos
    elo_calculator = EloCalculator.new(
      match.defender,
      match.challenger,
      match.winner
    )
    elo_calculator.calculate_elo
  end
end
