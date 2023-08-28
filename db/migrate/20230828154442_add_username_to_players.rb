class AddUsernameToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :username, :string
  end
end
