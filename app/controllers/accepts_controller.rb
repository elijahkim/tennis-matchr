class AcceptsController < ApplicationController
  def create
    match_creator = MatchCreator.new(match_request)
    match_creator.new_match

    redirect_to :back
  end

  private

  def match_request
    @match_request ||= MatchRequest.find(params[:match_request_id])
  end
end
