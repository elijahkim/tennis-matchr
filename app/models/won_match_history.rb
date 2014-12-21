class WonMatchHistory < SimpleDelegator
  attr_reader :match

  def initialize(match)
    @match = match
    super(@match)
  end

  def match_outcome_class
    "match-stats-winner"
  end

  def elo_delta
    "+ #{match.elo_delta}"
  end

  def win_or_lose
    "won"
  end
end
