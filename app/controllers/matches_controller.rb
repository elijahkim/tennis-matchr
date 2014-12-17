class MatchesController < ApplicationController
  before_action :winner_submitted, only: [:edit, :update]

  def show
    @match = find_match
    decorate_match
  end

  def edit
    @match = find_match_from_player
    if @match.blank?
      you_naughty_boy
    end
  end

  def update
    @match = find_match_from_player
    if @match.update(match_params)
      EloUpdater.new(@match).update_elo
      flash[:notice] = "Match has been successfully submitted"
      redirect_to dashboard_path
    else
      :edit
    end
  end

  private

  def decorate_match
    unless @match.winner?
      @match = UncompletedMatch.new(@match)
    end
  end 

  def find_match
    Match.find(params[:id])
  end

  def find_match_from_player
    Match.where(
      "defender_id = :user OR challenger_id = :user",
      user: current_user.id
    ).find_by(id: params[:id])
  end

  def match_params
    params.require(:match).permit(:winner_id)
  end

  def winner_submitted
    match = find_match

    if match.winner
      flash[:notice] = "Match winner has already been submitted"
      redirect_to root_path
    end
  end
end
