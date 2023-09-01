class Player < ApplicationRecord
  belongs_to :user
  has_many :challenges, dependent: :destroy
  has_many :treasure_chests, dependent: :destroy

  validates :username, :healthpoints, :hitpoints, :rubies, presence: true
end
