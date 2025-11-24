class BloodRequest < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  has_many :donations, dependent: :destroy
  has_many :notifications, dependent: :destroy
  # has_many :messages, dependent: :destroy

  BLOOD_TYPES = %w[A- A+ B- B+ AB- AB+ O- O+].freeze

  validate :needed_by
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
