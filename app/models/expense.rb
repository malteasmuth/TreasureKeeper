class Expense < ApplicationRecord
  belongs_to :player
  belongs_to :challenge

  validates :amount, :expense_date, presence: true
  validate :expense_date_cannot_be_in_future
 
  def expense_date_cannot_be_in_future
    if expense_date.present? && expense_date > Date.today
      errors.add(:expense_date, "can't be in the future")
    end
  end
  def amount_cannot_be_zero
    if amount.present? && amount.zero?
      errors.add(:amount, "can't be zero")
    end
  end
end
