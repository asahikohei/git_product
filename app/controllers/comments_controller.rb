class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
  end
  
  private
  def comment_params
    params.permit(:text, :tweet_id).merge(user_id: current_user.id)
  end
end
