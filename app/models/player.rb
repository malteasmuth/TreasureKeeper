class Player < ApplicationRecord
  belongs_to :user

  validates :username, :healthpoints, :hitpoints, :rubies, presence: true
end
