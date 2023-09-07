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

  def check_attack(expenses, challenge)
    sum = 0
    expenses.each do |expense|
      sum += expense.amount
    end
    monster_rage = ((sum / [challenge.budget, 1].max) * 100)
    if monster_rage > 75
      attack_chance = 40
    elsif monster_rage > 50
      attack_chance = 20
    else
      attack_chance = 10
    end
    return [attack_chance, monster_rage]
  end
end
