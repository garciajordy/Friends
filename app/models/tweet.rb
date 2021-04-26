class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  validates :text, presence: true
end
