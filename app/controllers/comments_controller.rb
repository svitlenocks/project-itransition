class CommentsController < ApplicationController
  before_action :set_compaign

  def create
    @comment = @compaign.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def destroy
    @comment = @compaign.comments.find(params[:id])
    @comment_id = @comment.id
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :compaign_id)
  end

  def set_compaign
    @compaign = Compaign.find(params[:compaign_id])
  end

end
