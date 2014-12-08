class EloUpdater
  attr_accessor :match, :new_elos

  def initialize(match)
    @match = match
    @new_elos = []
  end

  def update_elo
    new_elos = get_new_elos
    match.defender.elo = new_elos[0]
    match.defender.save
    match.challenger.elo = new_elos[1]
    match.challenger.save
  end

  private

  def get_new_elos
    elo_calculator = EloCalculator.new(
      match.defender,
      match.challenger,
      match.winner
    )
    self.new_elos = elo_calculator.calculate_elo
  end
end
