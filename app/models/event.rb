class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations
  has_many :attendee, through: :invitations, source: :user

  scope :upcoming_events, -> { where('date >= ?', Time.zone.now) }
  scope :previous_events, -> { where('date <  ?', Time.zone.now) }

  validates :date, presence: true
  validates :name, presence: true
end
