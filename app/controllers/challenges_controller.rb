class ChallengesController < ApplicationController
  def index
  end

  def show
    @challenge = Challenge.find(params[:id])
    @player = Player.find_by(user_id: current_user)
    @monster = Monster.find(@challenge.monster_id)
    @expenses = Expense.where(challenge_id: @challenge.id)
    @monster_rage = monster_rage
    check_attack(@challenge)
  end

  def new
    @challenge = Challenge.new
  end


  def create
    @current_player = Player.find_by(user_id: current_user)
    @challenge = Challenge.new(challenge_params)
    @challenge.player_id = @current_player.id
    monster = Monster.create(healthpoints: 20, hitpoints: 15)
    @challenge.monster_id = monster.id
    if @challenge.save
      @monster = Monster.create(healthpoints: 20, hitpoints: 15, challenge_id: @challenge.id)
      redirect_to challenge_path(@challenge)
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
    @monster.save
    redirect_to challenge_path(@challenge)
  end

  private

  def check_attack(challenge)
    attack_chance = 0
    if @monster_rage > 75
      attack_chance = 80
    elsif @monster_rage > 50
      attack_chance = 60
    else
      attack_chance = 50
    end

    return unless rand(1..100) <= attack_chance
      @player.healthpoints -= ((@monster.hitpoints + @monster_rage) / 100)
      @player.save
  end

  def challenge_params
    params.require(:challenge).permit(:name, :description, :budget, :end_date)
  end

  def monster_rage
    sum = 0
    @expenses.each do |expense|
      sum += expense.amount
    end
    return ((sum / @challenge.budget) * 100).round
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
end
