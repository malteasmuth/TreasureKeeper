class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    # aLL of the players
    @players = Player.all
  end

  def show
  end

  #Create a new player
  # One user story, two actions:

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.user = current_user

    if @player.save
      redirect_to root_path, notice: 'Player was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update

  end

  def delete
  end

# strong params
  private

  def player_params
    params.require(:player).permit(:avatar, :avatar_url, :hitpoints, :rubies, :balance, :level, :objective)
  end

  def set_player
    @player = Player.find(params[:id])
  end

end
