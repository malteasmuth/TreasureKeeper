class Challenge < ApplicationRecord
  # belongs_to :player
  belongs_to :treasure_chest
  has_many :expenses, dependent: :destroy
  has_many :monsters, dependent: :destroy
  # validates :name, :description, :monster, :end_date, :status, presence: true
  validates :name, :description, :status, :budget, :end_date, presence: true
  validate :end_date_cannot_be_in_past

  def end_date_cannot_be_in_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end
  enum status: %i[ongoing lost won]
end
