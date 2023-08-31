class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @challenges = Challenge.all
    @challenge = Challenge.find_by(player_id: current_user, status: "running")
    @player = Player.find_by(user_id: current_user)
  end
end
