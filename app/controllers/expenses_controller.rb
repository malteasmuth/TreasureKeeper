class ExpensesController < ApplicationController
  before_action :get_player

  def show
  end

  def new
    @expense = Expense.new
    @challenge = Challenge.find(params[:challenge_id])
    @treasure_chest = @challenge.treasure_chest
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.player_id = Player.find_by(user_id: current_user).id
    @expense.challenge_id = Challenge.find(params["challenge_id"]).id

    if @expense.save
      redirect_to home_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def expense_params
    params.require(:expense).permit(:amount, :expense_date, :challenge_id)
  end

  def get_player
    @current_player = Player.find_by(user_id: current_user)
  end
end
