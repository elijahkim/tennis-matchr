class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(new_comment_params)
    @comment.save

    redirect_to match_request_path(@comment.match_request)
  end

  def edit
    comment
  end

  def update
    comment.update(comment_params)

    redirect_to comment.match_request
  end

  def destroy
    comment.destroy

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def new_comment_params
    comment_params.merge(match_request_id: params[:match_request_id])
  end

  def comment
    @comment ||= Comment.find(params[:id])
  end
end
