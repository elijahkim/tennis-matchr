class DashboardsController < ApplicationController
  def show
    @incoming_match_requests = incoming_match_requests
  end

  private

  def incoming_match_requests
    current_user.incoming_match_requests.pending
  end
end
