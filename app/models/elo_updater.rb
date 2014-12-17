class EloUpdater
  attr_accessor :match

  def initialize(match)
    @match = match
  end

  def update_elo
    match.update(
      challenger_elo: challenger_new_elo,
      defender_elo: defender_new_elo,
      elo_delta: elo_delta
    )
    match.defender.update(elo: defender_new_elo)
    match.challenger.update(elo: challenger_new_elo)
  end

  private

  def win?(player, winner)
    player == winner
  end

  def defender_new_elo
    @defender_new_elo ||= EloCalculator.new(
      match.defender,
      match.challenger,
      win?(match.defender, match.winner)
    ).results
  end

  def challenger_new_elo
    @challenger_new_elo ||= EloCalculator.new(
      match.challenger,
      match.defender,
      win?(match.challenger, match.winner)
    ).results
  end

  def elo_delta
    (match.defender.elo - defender_new_elo).abs
  end
end
