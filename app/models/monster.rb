class Monster < ApplicationRecord
  has_one_attached :picture

  def icon_creator
    case self.image_url
    when "Orc"
      "orc1.png"
    when  "Troll"
      "troll.png"
    when  "Orc2"
      "orc2.png"
    when "Orc3"
      "orc3.png"
    when "Dragon"
      "dragon1.png"
    else
      "dragon2.png"
    end
  end

end
