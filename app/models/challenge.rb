class Challenge < ApplicationRecord
  belongs_to :player
  belongs_to :monster
  belongs_to :expense
end
