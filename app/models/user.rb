class User < ApplicationRecord
  has_many :followings
  has_many :followers, through: :followings
  has_many :followed_by_me, through: :followings, foreign_key: "friend_id"
  has_many :tweets, foreign_key: "author_id"
  scope :my_followers, -> {where(friend_id: current_user.id)}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
