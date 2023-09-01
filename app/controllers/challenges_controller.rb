class ChallengesController < ApplicationController
  before_action :get_player

  def index
  end

  def show
    @challenge = Challenge.find(params[:id])
    @player = Player.find_by(user_id: current_user)
    @monster = Monster.find(@challenge.monster_id)
    @expenses = Expense.where(challenge_id: @challenge.id)
    @monster_rage = monster_rage
    check_attack
    resolve_challenge
  end

  def new
    @challenge = Challenge.new
    @treasure_chest = TreasureChest.find(params["treasure_chest_id"])
  end

  def create
    @current_player = Player.find_by(user_id: current_user)
    @treasure_chest = TreasureChest.find(params["treasure_chest_id"])
    @challenge = Challenge.new(challenge_params)
    @challenge.player_id = @current_player.id
    @challenge.treasure_chest = @treasure_chest
    monster = Monster.create(healthpoints: 20, hitpoints: 20)
    @challenge.monster_id = monster.id
    if @challenge.save
      redirect_to treasure_chest_challenge_path(@treasure_chest, @challenge)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def player_attack
    @challenge = Challenge.find(params["challenge_id"])
    @player = Player.find_by(user_id: current_user)
    @monster = Monster.find(@challenge.monster_id)

    @damage_dealt = calculate_damage
    @monster.healthpoints -= @damage_dealt
    redirect_to challenge_path(@challenge)
  end

  private

  def check_attack
    attack_chance = 0
    if @monster_rage > 75
      attack_chance = 80
    elsif @monster_rage > 50
      attack_chance = 40
    end
    
    return unless rand(1..100) <= attack_chance

    @player.update(healthpoints: (@player.healthpoints - 10))
  end

  def challenge_params
    params.require(:challenge).permit(:name, :description, :budget, :end_date, :treasure_chest_id)
  end

  def monster_rage
    sum = 0
    @expenses.each do |expense|
      sum += expense.amount
    end
    return ((sum / @challenge.budget) * 100)
  end

  def calculate_damage
    if rand(1..10) == 1
      0
    elsif rand(1..10) == 2
      @player.hitpoints * rand(1.4..2.0).to_i
    else
      @player.hitpoints
    end
  end

  def resolve_challenge
    if @monster_rage >= 100
      @challenge.lost!
    elsif @monster_rage < 100 && Date.today > @challenge.end_date
      @challenge.won!
      if @challenge.treasure_chest.current_value.nil?
        @challenge.treasure_chest.current_value = 0
      end
      @challenge.treasure_chest.current_value += @challenge.budget - @challenge.current_value
      @challenge.treasure_chest.save
    end
  end

  def get_player
    @current_player = Player.find_by(user_id: current_user)
  end
end
