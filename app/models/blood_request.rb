class BloodRequest < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  has_many :donations, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :messages, as: :threadable, dependent: :destroy
  belongs_to :accepted_by, class_name: "User", optional: true

  BLOOD_TYPES = %w[A- A+ B- B+ AB- AB+ O- O+].freeze

  validate :needed_by_within_range
  validates :quantity, numericality: { greater_than: 0 }

  enum status: {
    pending: 0,
    accepted: 1,
    # rejected: 2,
    completed: 2
  }

  enum urgency: {
    normal: 0,
    urgent: 1,
    critical: 2
  }

  scope :accepted_by, ->(user) { where(status: statuses[:accepted], accepted_by_id: user.id) }

  def accepted_by?(user)
    accepted_by_id == user.id
  end
  # active requests
  scope :active, -> { where(status: statuses[:pending]) }

  # Urgent requests (urgent & critical)
  scope :urgent, -> { where(urgency: [1, 2]) }
  scope :urgent_or_critical, -> { where(urgency: ['urgent', 'critical']) }

  # Critical requests
  scope :critical, -> { where(urgency: 2) }

  # Filter by blood type
  scope :by_blood_type, ->(blood_type) { where(blood_type: blood_type) }

  scope :for_donor, -> {
    active.order(urgency: :desc, needed_by: :asc)
  }

  # Recently created requests (last 7 days)
  scope :recent, -> { where('created_at >= ?', 7.days.ago) }

  # Requests needed soon (within next 3 days)
  scope :needed_soon, -> { where('needed_by <= ?', 3.days.from_now) }

  # set urgency automatically based on needed_by
  before_save :set_urgency_based_on_date

  def can_be_completed?
    pending? && donations.sum(:quantity) >= quantity
  end

  def days_until_needed
    return nil if needed_by.blank?
    (needed_by - Date.today).to_i
  end

  def urgency_color
    case urgency
    when 'critical' then 'danger'
    when 'urgent' then 'warning'
    when 'normal' then 'info'
    else 'secondary'
    end
  end
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
