class MatchActivityCreator
  attr_reader :match

  def initialize(match)
    @match = match
  end

  def update_match_activities
    update_match_activities_for_challenger
    update_match_activities_for_defender
  end

  private

  def update_match_activities_for_challenger
    Activity.create(
      subject: match,
      name: "A score for your match with #{match.defender_username} has been submitted",
      direction: "to",
      user: match.challenger
    )
  end

  def update_match_activities_for_defender
    Activity.create(
      subject: match,
      name: "A score for your match with #{match.challenger_username} has been submitted",
      direction: "from",
      user: match.defender
    )
  end
end
