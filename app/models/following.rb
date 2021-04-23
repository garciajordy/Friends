class Following < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :followed_by_me, class_name: "User", foreign_key: "friend_id"
end
