class AddDefaultToTreasureChests < ActiveRecord::Migration[7.0]
  def change
    change_column_default :treasure_chests, :status, 0
  end
end
