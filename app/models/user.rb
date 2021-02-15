class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :invitations
  has_many :attended_events, through: :invitations, source: :event
  validates :name, presence: true, uniqueness: true
end
