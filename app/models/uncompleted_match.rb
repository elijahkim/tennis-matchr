class UncompletedMatch < SimpleDelegator
  def challenger_elo
    challenger.elo
  end

  def defender_elo
    defender.elo
  end
end
