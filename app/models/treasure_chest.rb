class TreasureChest < ApplicationRecord
  belongs_to :player
  has_many :challenges, dependent: :destroy

  validates :name, :description, :value, presence: true

  enum status: %i[ongoing lost won]

  def value_cannot_be_zero
    if value.present? && value.zero?
      errors.add(:value, "Amount can't be zero")
    end
  end
end
