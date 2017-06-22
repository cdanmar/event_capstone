class Event < ApplicationRecord
  has_many :listed_participants
  # has_many :visitors, :through => :listed_participants
  has_many :visitors, through: :listed_participants
end
