class Challenge < ApplicationRecord

  # belongs_to :player
  # belongs_to :monster
  has_many :expenses
  validates :name, :description, :end_date, :status, presence: true

  enum status: %i[running lost won]
end
