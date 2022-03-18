class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :experience_users
  has_many :experiences, through: :experience_users
  has_many :messages
  has_many :chatrooms, through: :chatroom_users

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_one_attached :photo
end
