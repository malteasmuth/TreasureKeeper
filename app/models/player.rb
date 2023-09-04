class Player < ApplicationRecord
  belongs_to :user
  has_many :challenges, dependent: :destroy
  has_many :treasure_chests, dependent: :destroy
  validates :username, :healthpoints, :hitpoints, :rubies, presence: true
  validates :user, uniqueness: true

  has_one_attached :picture

  def icon_creator
    case self.avatar_url
    when "Knight"
      "knight.png"
    when  "Elf1"
      "elf1.png"
    when  "Elf2"
      "elf2.png"
    when "Swordman"
      "swordman.png"
    when "Queen"
      "queen.png"
    else
      "wizard.png"
    end
  end
end
