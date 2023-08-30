class ChallengesController < ApplicationController
  def index
  end

  def show
    @challenge = Challenge.find(params[:id])
    @monster = Monster.find(@challenge.monster_id)
  end

  def new
    @challenge = Challenge.new
  end


  def create
    @current_player = Player.find_by(user_id: current_user)
    @challenge = Challenge.new(challenge_params)
    @challenge.player_id = @current_player.id

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
    @player.healthpoints
    @player.hitpoints
    @player.rubies


    @monster = Monster.find(@challenge.monster_id)
    @monster.healthpoints
    @monster.hitpoints

    @damage_dealt = calculate_damage
    @monster.healthpoints -= @damage_dealt
    @monster.save
    redirect_to challenge_path(@challenge)
  end

  private

  def challenge_params
    params.require(:challenge).permit(:name, :description)
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
