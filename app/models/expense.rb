class Expense < ApplicationRecord
  belongs_to :player
  belongs_to :challenge
  
  validates :amount, :expense_date, presence: true
end
