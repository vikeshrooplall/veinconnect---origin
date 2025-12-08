class Donation < ApplicationRecord
  belongs_to :donor
  belongs_to :blood_request
  belongs_to :facility

  validates :donor_id, :blood_request_id, presence: true
  enum :status, { accepted: 0, rejected: 1, completed: 2 }
  after_create :update_donor_last_donation_date

  private

  def update_donor_last_donation_date
    donor.update(last_donation_date: created_at.to_date)
  end
end
