class BloodRequest < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  has_many :donations, dependent: :destroy
  has_many :notifications, dependent: :destroy
  # has_many :messages, dependent: :destroy

  BLOOD_TYPES = %w[A- A+ B- B+ AB- AB+ O- O+].freeze

  validate :needed_by_within_range
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
  # set urgency automatically based on needed_by
  before_save :set_urgency_based_on_date

  # Urgent requests (urgent & critical)
  scope :urgent, -> { where(urgency: [:urgent, :critical]) }

  # Critical requests
  scope :critical, -> { where(urgency: :critical) }

  # active requests
  scope :active, -> { where(status: :pending) }

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

  def set_urgency_based_on_date
    return if needed_by.blank?

    days_until_needed = (needed_by - Date.today).to_i

    if days_until_needed <= 2
      self.urgency = :critical

    elsif days_until_needed <=7
      self.urgency = :urgent
    else
      self.urgency = :normal
    end
  end
end
