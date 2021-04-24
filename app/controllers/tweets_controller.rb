class TweetsController < ApplicationController
    before_action :authenticate_user!
    def index
        @tweets = Tweet.all
    end

    def show
        @tweet = Tweet.find(params[:id])
    end

    def create
        @tweet = current_user.tweets.create(tweet_params)
        redirect_to @tweet
    end

    private
    def tweet_params
        params.require(:tweet).permit(:text)
    end
end
