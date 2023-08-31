class Challenge < ApplicationRecord
  # belongs_to :player
  belongs_to :treasure_chest, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :monsters, dependent: :destroy
  # validates :name, :description, :monster, :end_date, :status, presence: true
  validates :name, :description, :status, presence: true

  enum status: %i[running lost won]
end
