class Challenge < ApplicationRecord
  belongs_to :player
  belongs_to :monster
  belongs_to :expense

  validates :name, :description, :end_date, presence: true
  validates :status, presence: true
end
