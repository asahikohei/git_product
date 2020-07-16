class TweetsController < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
    @tweets = Tweet.includes(:user).all.order("created_at DESC").page(params[:page]).per(3)
  end
  
  def new
  end
  
  def create
    @tweet = Tweet.create(tweet_params)
  end
  
  def destory
    @tweet = Tweet.find(params[:id])
    if current_user.id == @tweet.user_id
      @tweet.destory
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if current_user.id == @tweet.user_id
      @tweet.update(tweet_params)
    end
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  private
  def tweet_params
    params.permit(:text, :image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to :root
    end
  end
end
