class AddDefaultValuesToProperties < ActiveRecord::Migration[7.0]
  def change
    change_column_default :challenges, :status, 0
    change_column_default :players, :healthpoints, 100
    change_column_default :players, :hitpoints, 20
    change_column_default :players, :rubies, 50
  end
end
