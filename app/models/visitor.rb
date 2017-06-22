class Visitor < ApplicationRecord
  has_many :listed_participants
  has_many :events, through: :listed_participants
end
