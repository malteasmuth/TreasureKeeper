class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.user = current_user

    if @player.save
      redirect_to home_path, notice: 'Player was successfully created.'
    else
      render :new
    end
  end

  def category

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
    params.require(:player).permit(:avatar_url, :username)
  end

  def set_player
    @player = Player.find(params[:id])
  end

end
