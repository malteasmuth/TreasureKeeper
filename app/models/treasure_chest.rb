class TreasureChest < ApplicationRecord
  belongs_to :player
  has_many :challenges, dependent: :destroy

  validates :name, :description, :value, presence: true

  enum status: %i[ongoing lost won]
end
