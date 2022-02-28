class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :experience_users
  has_many :experiences, through: :experience_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
