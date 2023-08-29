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
    @current_player = Player.where(user_id: current_user)
    @challenge = Challenge.new(challenge_params)
    @challenge.player_id = @current_player
    @challenge.monster_id = Monster.new(creature_type: "dragon")
    raise
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def challenge_params
    params.require(:challenge).permit(:name, :description)

  end

end
