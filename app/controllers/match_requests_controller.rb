class MatchRequestsController < ApplicationController
  def new
    get_opponent
    @match_request = MatchRequest.new
  end

  def create
    get_opponent
    @match_request = MatchRequest.new(new_match_request_params)
    if @match_request.save
      redirect_to @match_request
    else
      render :new
    end
  end

  def show
    @match_request = MatchRequest.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @match_request = find_match_request_from_player
    if @match_request.blank?
      you_naughty_boy
    end
  end

  def update
    @match_request = find_match_request_from_player
    if @match_request.update(match_request_params)
      redirect_to @match_request
    else
      render :edit
    end
  end

  def destroy
    match_request = MatchRequest.find(params[:id])
    match_request.destroy

    redirect_to dashboard_path
  end

  private

  def find_match_request_from_player
    MatchRequest.where(
      "requester_id = :user OR opponent_id = :user",
      user: current_user.id
    ).find_by(id: params[:id])
  end

  def new_match_request_params
    match_request_params.merge(
      requester: current_user,
      requester_elo: current_user.elo,
      opponent: get_opponent,
      opponent_elo: get_opponent.elo
    )
  end

  def match_request_params
    params.require(:match_request).permit(
      :end_date,
      :match_at,
      :request_message,
      :start_date
    )
  end

  def get_opponent
    @opponent ||= User.find(params[:user_id])
  end
end
