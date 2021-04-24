class User < ApplicationRecord
  has_many :followings
  has_many :followers, through: :followings, foreign_key: "user_id"
  has_many :tweets, foreign_key: "author_id"
  scope :my_followers, -> {Following.where(follower_id: current_user.id)}
  validates :username, length: { maximum: 12, minimum: 3}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
