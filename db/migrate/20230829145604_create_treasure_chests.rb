class CreateTreasureChests < ActiveRecord::Migration[7.0]
  def change
    create_table :treasure_chests do |t|
      t.string :name
      t.string :description
      t.float :value
      t.integer :status
      t.references :player, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
