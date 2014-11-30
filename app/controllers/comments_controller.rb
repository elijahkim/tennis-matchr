class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save

    redirect_to @comment.match_request 
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    redirect_to @comment.match_request
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :match_request_id)
  end
end
