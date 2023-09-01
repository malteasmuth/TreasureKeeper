class TreasureChestsController < ApplicationController
  def index
    @current_player = Player.find_by(user_id: current_user)
    @treasure_chests = TreasureChest.where(player_id: @current_player.id)
  end

  def show
    @curent_player = Player.find_by(user_id: current_user)
    @treasure_chest = TreasureChest.find(params[:id])
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
end
