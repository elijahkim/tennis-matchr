class AcceptsController < ApplicationController
  def create
    @match_request = MatchRequest.find(params[:match_request_id])
    @match_request.update(confirmed: true)
    @match_request.save

    redirect_to :back
  end
end
