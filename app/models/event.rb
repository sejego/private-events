class Event < ApplicationRecord
  belongs_to :creators, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendings, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendings, source: :attendee
  validates :name, presence: true, length: {maximum: 40}
  validates :event_date, presence: true
  validates :location, presence: :true

  scope :past, -> { where('event_date < ?', Date.today) }
  scope :upcoming, -> { where('event_date >= ?', Date.today) }
end
