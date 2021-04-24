class FollowingsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:format])
    @following = current_user.followings.create(follower_id: @user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @following = Following.find(params[:id])
    @following.destroy
    redirect_back(fallback_location: root_path)
  end
end
