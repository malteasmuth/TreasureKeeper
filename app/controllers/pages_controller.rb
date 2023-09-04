class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :landing ]
  before_action :get_player

  def home
    @player = Player.find_by(user_id: current_user)
    @challenges = Challenge.where(player_id: @player.id, status: "running")
    @challenge = Challenge.find_by(player_id: current_user, status: "running")
  end

  def get_player
    @current_player = Player.find_by(user_id: current_user)
  end

  def landing
  end
end
