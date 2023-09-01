class Player < ApplicationRecord
  belongs_to :user
  has_many :challenges, dependent: :destroy
  has_many :treasure_chests, dependent: :destroy

  validates :username, :healthpoints, :hitpoints, :rubies, presence: true

  has_one_attached :picture

  def icon_creator(category)
    case self.category

      when "Knight"
        "knight.png"
      when  "Elf"
        "elf1.png"
      else
        "Wizard.png"
      end
  end

end
