class DonorProfile < ApplicationRecord
  belongs_to :user

  has_many :donations, foreign_key: 'donor_id', dependent: :destroy

  validates :blood_type, presence: true
  validates :user_id, uniqueness: true

  enum blood_type: {
    "A-" => 0, "A+" => 1,
    "AB-" => 2, "AB+" => 3,
    "B-" => 4, "B+" => 5,
    "O-" => 6, "O+" => 7
  }

  enum donor_status: { active: 0, inactive: 1 }

  enum eligibility_status: { eligible: 0, ineligible: 1 }
end
