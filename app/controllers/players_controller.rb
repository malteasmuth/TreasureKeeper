class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show

  end

  def new
    @player = Player.new
  end

  def save

  end

  def create
    @player = Player.new(params[:id])
    @player.user = current_user # Assign the new player to the current user
  end

  def edit
  end

  def update

  end

  def delete
  end
  # strong params
  # private

  # def set_player
  #   @player = Player.find(params[:id])
  # end

  # def player_params
  #   params.require(:player).permit(:username)
  # end
end