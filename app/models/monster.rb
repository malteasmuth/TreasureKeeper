class Monster < ApplicationRecord
  belongs_to :challenges
  has_one_attached :picture
  def icon_creator
    case self.image_url
    end
      when "Orc"
        "ork1.png"
      when  "Troll"
        "troll.png"
      else
        "dragon1.png"
      end
  end

end
