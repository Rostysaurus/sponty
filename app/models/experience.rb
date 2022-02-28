class Experience < ApplicationRecord
  belongs_to :user
  has_many :experience_users
  has_many :experiences, through: :experience_users

  validates :name, :address, :type, presence: true
  validates :busyness, inclusion: { in: %w(busy semi-busy empty),
    message: "%{value} is not a valid busyness" }
end
