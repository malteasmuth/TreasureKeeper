class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.float :amount
      t.date :expense_date
      t.references :player, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
