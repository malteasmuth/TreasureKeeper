class AddCategoryToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :category, :string
  end
end
