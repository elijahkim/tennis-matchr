class MatchHistoriesController < ApplicationController
  def show
    @matches = current_user_matches.order(match_at: :desc).map do |match|
      if match.winner == current_user
        WonMatchHistory.new(match)
      else
        LostMatchHistory.new(match)
      end
    end

    @matches = Kaminari.paginate_array(@matches).page(params[:page])
  end

  private

  def current_user_matches
    current_user.matches.where("winner_id IS NOT NULL")
  end
end
