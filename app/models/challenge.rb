class Challenge < ApplicationRecord
  # belongs_to :player
  belongs_to :treasure_chest
  has_many :expenses, dependent: :destroy
  has_many :monsters, dependent: :destroy
  # validates :name, :description, :monster, :end_date, :status, presence: true
  validates :name, :description, :status, :budget, :end_date, presence: true

  enum status: %i[running lost won]
end
