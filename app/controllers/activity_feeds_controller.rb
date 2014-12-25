class ActivityFeedsController < ApplicationController
  def show
    @activities = current_user.activities.order(created_at: :desc)
  end
end
