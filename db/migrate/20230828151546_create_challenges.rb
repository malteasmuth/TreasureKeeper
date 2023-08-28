class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.references :player, null: false, foreign_key: true
      t.date :end_date

      t.timestamps
    end
  end
end
