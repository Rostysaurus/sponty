class Experience < ApplicationRecord
  belongs_to :user
  has_many :experience_users, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :address, :event_type, presence: true
  # validates :busyness, inclusion: { in: %w(busy semi-busy empty),
  # message: "%{value} is not a valid busyness" }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address_and_event_type,
    against: [ :name, :address, :event_type ],
    using: {
      tsearch: { prefix: true }
    }
end
