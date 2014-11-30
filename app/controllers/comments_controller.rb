class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :match_request_id)
  end
end
