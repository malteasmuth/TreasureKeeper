class RemoveBalanceFromPlayers < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :balance, :float
    remove_column :players, :level, :integer
    remove_column :players, :objective, :string
    remove_column :players, :avatar, :string
  end
end
