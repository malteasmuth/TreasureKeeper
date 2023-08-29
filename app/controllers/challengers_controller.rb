class ChallengesController < ApplicationController
  def player_attack
    @player = Player.where(user_id = currentUser)
    @player.healthpoints
    @player.hitpoints
    @player.rubies

    @monster = @challenge.monster_id
    @monsters.healthpoints
    @monster.hitpoints

    @damage_dealt = calculate_damage
    @monsters.hitpoints -= @damage_dealt
    @monsters.save
  end

  private

  def calculate_damage
    if rand(1..10) == 1
      0
    elsif rand(1..10) == 2
      @player.hitpoints * rand(1.4..2.0).to_i
    else
      @player.hitpoints
    end
  end
end
