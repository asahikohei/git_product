class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
  end
  
  private
  def comment_params
    @tweet = Tweet.find(params[:id])
    params.permit(:text).merge(user_id: current_user.id, tweet_id: @tweet.id)
  end
end
