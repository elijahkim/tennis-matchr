class ActivityFeedsController < ApplicationController
  def show
    @activities = current_user.activities.
      order(created_at: :desc).
      page params[:page]
  end
end
