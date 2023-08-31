class TreasureChestsController < ApplicationController
  def index
    @current_player = Player.find_by(user_id: current_user)
    @treasure_chests = TreasureChest.where(player_id: @current_player.id)
  end

  
end
