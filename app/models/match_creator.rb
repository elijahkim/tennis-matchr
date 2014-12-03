class MatchCreator
  attr_accessor :match_request

  def initialize(match_request)
    @match_request = match_request
  end

  def new_match
    match_request.confirm!

    Match.create(
      challenger: match_request.requester,
      opponent: match_request.opponent,
      match_at: match_request.match_at
    )
  end
end
