class AddAvatarToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :Avatar, :string
  end
end
