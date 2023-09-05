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

  def level_up
    @player = Player.find_by(user_id: current_user)

    if @player.experience_points >= @player.level * 10
    @player.update(level: (@player.level += 1))
    @player.update(healthpoints: (@player.healthpoints += 5))
    @player.update(healthpoints: (@player.hitpoints += 2))
    end
    redirect_to player_path(@player)
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
