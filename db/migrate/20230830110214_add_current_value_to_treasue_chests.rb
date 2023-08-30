class AddCurrentValueToTreasueChests < ActiveRecord::Migration[7.0]
  def change
    add_column :treasure_chests, :current_value, :float
  end
end
