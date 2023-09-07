class ExpensesController < ApplicationController
  before_action :get_player

  def show
  end

  def new
    @expense = Expense.new
    @challenge = Challenge.find(params[:challenge_id])
    @treasure_chest = @challenge.treasure_chest
    @monster = Monster.find(@challenge.monster_id)
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.player_id = Player.find_by(user_id: current_user).id
    @challenge = Challenge.find(params[:challenge_id])

    @expense.challenge_id = @challenge.id

    monster = Monster.find(@expense.challenge.monster_id)

    if @expense.save
      monster.update(hitpoints: (monster.hitpoints += @expense.amount))
      redirect_to treasure_chest_challenge_path(@challenge.treasure_chest, @challenge)
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
