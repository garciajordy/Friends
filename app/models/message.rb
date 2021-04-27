class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :send_user, class_name: 'User'
  belongs_to :receive_user, class_name: 'User'
  validates :text, presence: true

  def self.my_messages(user)
    where(send_user_id: user.id).or(where(receive_user_id: user.id))
  end
end
