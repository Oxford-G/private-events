class Event < ApplicationRecord
  belongs_to :creator, class_name:'User'
  has_many :invitation
  has_many :attendee, through: :invitation, source: :user
end
