class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :experience
  has_many :users, through: :chatroom_users
end
