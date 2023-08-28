class AddExpensesToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_reference :challenges, :monster, foreign_key: true
    add_reference :challenges, :expense, foreign_key: true
  end
end
