class BloodRequest < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  has_many :donations, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :messages, dependent: :destroy

  validate :needed_by
  validates :quantity, numericality: { greater_than: 0 }

  enum blood_type: {
    "A-" => 0,
    "A+" => 1,
    "AB-" => 2,
    "AB+" => 3,
    "B-" => 4,
    "B+" => 5,
    "O-" => 6,
    "O+" => 7
  }

  enum status: {
    pending: 0,
    completed: 1
  }

  private

  def needed_by_within_range
    return if needed_by.blank?

    if needed_by < Date.today + 1.day
      errors.add(:needed_by, "must be at least 1 day from today")
    end

    if needed_by > Date.today + 30.days
      errors.add(:needed_by, "must be within 30 days from today")
    end
  end
end
