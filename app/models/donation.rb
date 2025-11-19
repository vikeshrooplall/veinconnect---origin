class Donation < ApplicationRecord
  belongs_to :donor_profile
  belongs_to :blood_request
  belongs_to :facility

  validates :donor_profile_id, :blood_request_id, presence: true
  enum :status, { accepted: 0, rejected: 1, completed: 2 }
end
