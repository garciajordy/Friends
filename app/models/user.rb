class User < ApplicationRecord
  has_many :followings
  has_many :likes
  has_many :followers, through: :followings, foreign_key: 'user_id'
  has_many :tweets, foreign_key: 'author_id'
  has_many :conversations
  has_many :messages, through: :conversations
  has_many :send_messages, class_name: 'Message', foreign_key: 'send_user_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receive_user_id'
  validates :username, length: { maximum: 12, minimum: 3 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
