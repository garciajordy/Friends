class ChangeFriendIdToFollowerIdInFollowings < ActiveRecord::Migration[6.1]
  def change
    rename_column :followings, :friend_id, :follower_id
  end
end
