class TreasureChest < ApplicationRecord
  belongs_to :player
  belongs_to :challenge
end
