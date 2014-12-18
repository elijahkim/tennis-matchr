class MatchHistoriesController < ApplicationController
  def show
    @matches = current_user_matches.map do |match|
      if match.winner == current_user
        WonMatchHistory.new(match)
      else
        LostMatchHistory.new(match)
      end
    end
  end

  private

  def current_user_matches
    current_user.matches.where("winner_id IS NOT NULL")
  end
end
