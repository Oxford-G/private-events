class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :invitation
  has_many :attended_events, through: :invitation, source: :user
end
