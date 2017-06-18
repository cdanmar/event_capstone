class ListedParticipant < ApplicationRecord
  belongs_to :visitors
  belongs_to :events
end
