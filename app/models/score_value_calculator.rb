class ScoreValueCalculator
  attr_reader :result
  attr_accessor :scores

  def initialize(result)
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
