class AcceptsController < ApplicationController
  before_action :check_for_match_date, only: [:create]

  def create
    match_creator = MatchCreator.new(match_request)
    match_creator.new_match

    redirect_to :back
  end

  private

  def match_request
    @match_request ||= MatchRequest.find(params[:match_request_id])
  end

  def check_for_match_date
    unless match_request.match_at
      flash[:notice] = "You must set a match date"
      redirect_to :back
    end
  end
end
