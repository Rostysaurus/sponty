class ExperienceUser < ApplicationRecord
  belongs_to :user
  belongs_to :experience
end
