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
    @challenge.monster_id = Monster.create(creature_type: "dragon").id
    if @challenge.save
      redirect_to challenge_path(@challenge)
    else
      render :new, status: :unprocessable_entitiy
    end
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
