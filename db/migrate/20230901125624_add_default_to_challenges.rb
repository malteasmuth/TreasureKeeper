class AddDefaultToChallenges < ActiveRecord::Migration[7.0]
  def change
    change_column_default :challenges, :current_value, 0
  end
end
