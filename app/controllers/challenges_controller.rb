class ChallengesController < ApplicationController
  def index
    @challenges = Challenges.all
  end

  def show
    @challenge = Challenges.find(params[:id])
  end

  def new
    
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
