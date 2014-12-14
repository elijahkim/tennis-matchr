class ScoreValueCalculator
  attr_reader :players, :result
  attr_accessor :scores

  def initialize(players, result)
    @players = players
    @result = result
    @scores = []
  end

  def results
    if result
      scores.push(1)
      scores.push(0)
    else
      scores.push(0)
      scores.push(1)
    end
  end
end
