class TweetsController < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
    @tweets = Tweet.all.order("created_at DESC")
  end
  
  def new
  end
  
  def create
    @tweet = Tweet.create(tweet_params)
  end
  
  private
  def tweet_params
    params.permit(:name, :text, :image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to :root
    end
  end
end
