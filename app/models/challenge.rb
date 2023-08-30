class Challenge < ApplicationRecord
  # belongs_to :player
  # belongs_to :monster
  has_many :expenses
  # validates :name, :description, :monster, :end_date, :status, presence: true
  validates :name, :description, :status, presence: true

  enum status: %i[running lost won]
end
