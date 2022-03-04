class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :experience_users
  has_many :experiences, through: :experience_users
  has_one_attached :photo
  has_many :chatrooms, through: :chatroom_users
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
