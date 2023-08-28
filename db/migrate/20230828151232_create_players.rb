class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :avatar_url
      t.float :hitpoints
      t.float :healthpoints
      t.float :rubies
      t.float :balance
      t.integer :level
      t.string :objective
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
