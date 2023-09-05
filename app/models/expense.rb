class Expense < ApplicationRecord
  belongs_to :player
  belongs_to :challenge

end
