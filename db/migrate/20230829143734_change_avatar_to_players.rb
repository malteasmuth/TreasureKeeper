class ChangeAvatarToPlayers < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :Avatar, :string
    add_column :players, :avatar, :string
  end
end
