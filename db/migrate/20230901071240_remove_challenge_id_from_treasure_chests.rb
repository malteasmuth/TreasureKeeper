class RemoveChallengeIdFromTreasureChests < ActiveRecord::Migration[7.0]
  def change
    remove_column :treasure_chests, :challenge_id
  end
end
