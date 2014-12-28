class MatchRequestActivityCreator
  attr_reader :match_request

  def initialize(match_request)
    @match_request = match_request
  end

  def accept_match_request_activities
    accept_match_request_for_requester
    accept_match_request_for_opponent
  end

  def create_match_request_activities
    create_match_request_for_requester
    create_match_request_for_opponent
  end

  def destroy_match_request_activities
    destroy_match_request_for_requester
    destroy_match_request_for_opponent
  end

  private

  def accept_match_request_for_requester
    Activity.create(
      subject: match_request,
      name: "Match Request with #{match_request.opponent_username} has been accepted",
      direction: "to",
      user: match_request.requester
    )
  end

  def accept_match_request_for_opponent
    Activity.create(
      subject: match_request,
      name: "You have accepted a match with #{match_request.requester_username}",
      direction: "to",
      user: match_request.opponent
    )
  end

  def create_match_request_for_requester
    Activity.create(
      subject: match_request,
      name: "You requested a match with #{match_request.opponent_username}",
      direction: "to",
      user: match_request.requester
    )
  end

  def create_match_request_for_opponent
    Activity.create(
      subject: match_request,
      name: "#{match_request.requester_username} has requested a match",
      direction: "from",
      user: match_request.opponent
    )
  end

  def destroy_match_request_for_requester
    Activity.create(
      subject: match_request,
      name: "Your match with #{match_request.opponent_username} has been declined",
      direction: "to",
      user: match_request.requester
    )
  end

  def destroy_match_request_for_opponent
    Activity.create(
      subject: match_request,
      name: "Your match with #{match_request.requester_username} has been declined",
      direction: "from",
      user: match_request.opponent
    )
  end
end
