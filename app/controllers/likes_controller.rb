class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(tweet_id: params[:tweet_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
