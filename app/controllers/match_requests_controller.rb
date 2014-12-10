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
    match_request
    @comment = Comment.new
  end

  def edit
    match_request
  end

  def update
    if match_request.update(match_request_params)
      redirect_to match_request
    else
      render :edit
    end
  end

  private

  def new_match_request_params
    match_request_params.merge(
      requester: current_user,
      opponent: get_opponent
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

  def match_request
    @match_request ||= MatchRequest.find(params[:id])
  end

  def get_opponent
    @opponent = User.find(params[:user_id])
  end
end
