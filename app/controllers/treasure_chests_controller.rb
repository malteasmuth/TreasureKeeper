class TreasureChestsController < ApplicationController
  before_action :get_player

  def index
    @current_player = Player.find_by(user_id: current_user)
    @treasure_chests = TreasureChest.where(player_id: @current_player.id, status: "ongoing")
  end

  def show
    @current_player = Player.find_by(user_id: current_user)
    @treasure_chest = TreasureChest.find(params[:id])
    @challenges = @treasure_chest.challenges
  end

  def new
    @treasure_chest = TreasureChest.new
  end

  def create
    @treasure_chest = TreasureChest.new(treasure_params)
    @treasure_chest.player_id = Player.find_by(user_id: current_user).id
    if @treasure_chest.save
      redirect_to treasure_chests_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def treasure_params
    params.require(:treasure_chest).permit(:name, :description, :value)
  end

  def get_player
    @current_player = Player.find_by(user_id: current_user)
  end
end
