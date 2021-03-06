class AcceptsController < ApplicationController
  before_action :check_for_match_date, only: [:create]
  before_action :authorize, only: [:create]

  def create
    MatchCreator.new(match_request).new_match
    MatchRequestActivityCreator.
      new(match_request).
      accept_match_request_activities

    redirect_to root_path
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

  def authorize
    unless match_request.opponent == current_user
      redirect_to root_path
    end
  end
end
