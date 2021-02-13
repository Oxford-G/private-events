class User < ApplicationRecord
  # has_one :session
  has_many :events, foreign_key: :creator_id
  has_many :invitations
  has_many :attended_events, through: :invitations, source: :user
  validates :name, presence: true, uniqueness: true
end
