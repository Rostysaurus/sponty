class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :experience
  has_many :users, through: :chatroom_users
end
