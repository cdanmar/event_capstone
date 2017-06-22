class ListedParticipant < ApplicationRecord
  belongs_to :visitor
  belongs_to :event
end
