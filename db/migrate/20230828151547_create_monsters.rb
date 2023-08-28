class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.string :type
      t.float :hitpoints
      t.float :healthpoints
      t.integer :level
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
