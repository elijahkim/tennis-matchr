class MatchesController < ApplicationController
  before_action :winner_submitted, only: [:edit, :update]

  def show
    @match = find_match
  end

  def edit
    @match = find_match_from_player
    if @match.blank?
      you_naughty_boy
    end
  end

  def update
    @match = find_match_from_player
    if @match
      @match.update(match_params)
      redirect_to dashboard_path
    else
      you_naughty_boy
    end
  end

  private

  def find_match
    Match.find(params[:id])
  end

  def find_match_from_player
    Match.where(
      "defender_id = :user OR challenger_id = :user",
      user: current_user.id
    ).find_by(id: params[:id])
  end

  def you_naughty_boy
    flash[:notice] = "You can't do that"
    redirect_to root_path
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
