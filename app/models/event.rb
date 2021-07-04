class Event < ApplicationRecord
  belongs_to :creators, class_name: 'User', foreign_key: 'creator_id'
end
