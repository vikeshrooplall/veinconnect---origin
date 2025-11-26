class Donor < ApplicationRecord
  belongs_to :user
  has_many :donations, dependent: :destroy

  # validates :blood_type, presence: true
  validates :user_id, uniqueness: true

  before_validation :set_default_statuses
  before_save :update_eligibility_status


  scope :active, -> { where(donor_status: true) }

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

  private

  # Always set donor_status = true when a donor account is created
  def set_default_statuses
    self.donor_status = true if donor_status.nil?
  end

  # Determine if the donor is eligible to donate
  def update_eligibility_status
    if last_donation_date.blank?
      self.eligibility_status = true
    else
      # Assume 3-month (90-day) waiting period
      self.eligibility_status = last_donation_date <= 90.days.ago.to_date
    end
  end

end
