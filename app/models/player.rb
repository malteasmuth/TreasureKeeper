class Player < ApplicationRecord
  belongs_to :user
  has_many :challenges, dependent: :destroy
  has_many :treasure_chest, dependent: :destroy

  validates :username, :healthpoints, :hitpoints, :rubies, presence: true
end
