class Player < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :healthpoints, presence: true
  validates :hitpoints, presence: true
  validates :rubies, presence: true
end
