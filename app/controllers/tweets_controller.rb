class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @array = Following.where(user_id: current_user.id).select(:follower_id)
    @user = current_user
    @rray = []
    @rray.push(current_user.id)
    @array.map { |e| @rray.push(e.follower_id) }
    @tweets = Tweet.where(author: (current_user.followers.to_a << current_user)).order(created_at: :desc)
    @people = User.where.not(id: @rray)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @user = current_user
    @tweet = @user.tweets.create(tweet_params)
    flash[:success] = 'Your tweet got successfully created!'
    redirect_back(fallback_location: root_path)
  end

  private

  def timeline_tweets
    @timeline_tweets = Tweet.where(user: (current_user.followers.to_a << current_user))
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
