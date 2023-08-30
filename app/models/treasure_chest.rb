class TreasureChest < ApplicationRecord
  belongs_to :player
  belongs_to :challenge

  enum status: %i[running lost won]
end
