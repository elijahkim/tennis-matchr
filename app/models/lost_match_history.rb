class LostMatchHistory < SimpleDelegator
  attr_reader :match

  def initialize(match)
    @match = match
    super(@match)
  end

  def match_outcome_class
    "match-stats-loser"
  end

  def elo_delta
    "- #{match.elo_delta}"
  end

  def win_or_lose
    "lose"
  end
end
