class CommentsController < ApplicationController
  before_action :set_group


  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html {  redirect_to request.referer }
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
