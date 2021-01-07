class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to "/prototypes/#{comment.prototype.id}"
    else
      @prototype = Prototype.includes(:user)
      render template: "prototypes/show" and return
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
  
end