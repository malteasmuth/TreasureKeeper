class Monster < ApplicationRecord
  has_one_attached :picture

  def icon_creator
    case self.avatar_url
      when "Orc"
        "orc1.png"
      when  "Troll"
        "troll.png"
      else
        "dragon1.png"
      end
  end
end
