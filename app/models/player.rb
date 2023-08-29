class Player < ApplicationRecord
  belongs_to :user

  validates :name, :healthpoints, :hitpoints, :rubies, presence: true
end
