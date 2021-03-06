class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :attendings, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendings, source: :attended_event

  def attending?(event)
    Attending.where('attendee_id': id, 'attended_event_id': event.id).exists?
  end
end
