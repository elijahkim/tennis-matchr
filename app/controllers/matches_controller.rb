class MatchesController < ApplicationController
  def show
    @match = find_match
  end

  def edit
    @match = find_match
  end

  def update
    @match = find_match
    @match.update(match_params)

    redirect_to dashboard_path
  end

  private

  def find_match
    Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:winner_id)
  end
end
