class TreasureChestsController < ApplicationController
  def index
    @current_player = Player.find_by(user_id: current_user)
    @treasure_chests = TreasureChest.where(player_id: @current_player.id)
  end

  def new
    @treasure_chest = TreasureChest.new
  end

  def create
    @treasure_chest = TreasureChest.new(treasure_params)
    @treasure_chest.player_id = Player.find_by(user_id: current_user).id
    @treasure_chest.save
  end

  private

  def treasure_params
    params.require(:treasure_chest).permit(:name, :description, :value)
  end
end
