class AddColumnToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :budget, :float
    add_column :challenges, :current_value, :float
    add_reference :challenges, :treasure_chest, foreign_key: true
  end
end
