class AddDefaultToTreasureChest < ActiveRecord::Migration[7.0]
  def change
    change_column_default :treasure_chests, :current_value, 0
  end
end
