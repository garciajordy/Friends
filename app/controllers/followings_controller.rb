class FollowingsController < ApplicationController
    before_action :authenticate_user!
    def create
        @following = current_user.followings.create(params[:id])
    end

    def destroy
        @following = Following.find(params[:id])
        @following.destroy
    end
end
