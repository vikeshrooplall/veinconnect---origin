class Donor < ApplicationRecord
  BLOOD_TYPES = %w[A- A+ B- B+ AB- AB+ O- O+].freeze

  belongs_to :user
  has_many :donations, dependent: :destroy

  validates :blood_type, presence: true
  validates :user_id, uniqueness: true

  enum donor_status: { active: 0, inactive: 1 }
  enum eligibility_status: { eligible: 0, ineligible: 1 }

  def last_donation
    donations.order(created_at: :desc).first&.created_at
  end

  def has_previous_donations?
    donations.any?
  end

  def next_eligible_date
    return Date.today unless last_donation

    last_donation.to_date + 56.days
  end

  def eligible_to_donate
    return true unless last_donation
    Date.today >= next_eligible_date
  end
end
