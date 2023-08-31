class TreasureChest < ApplicationRecord
  belongs_to :player
  has_many :challenges, dependent: :destroy

  enum status: %i[running lost won]
end
