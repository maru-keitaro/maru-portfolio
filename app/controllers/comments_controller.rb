class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to can_path(@comment.can)
    else
      @can = @comment.can
      @comments = @can.comments
      render "cans/show"  # views/cans/show.html.erbのファイルを参照
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, can_id: params[:can_id])
  end
end
