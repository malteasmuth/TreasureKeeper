class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
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
