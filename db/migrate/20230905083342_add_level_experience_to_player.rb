class AddLevelExperienceToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :level, :integer, default: 1
    add_column :players, :experience_points, :integer, default: 0
  end
end
