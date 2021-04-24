module TweetsHelper
    def follower(user)
        Following.where(follower_id:user.id)
    end
end
