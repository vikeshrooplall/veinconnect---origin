class DonorProfile < ApplicationRecord
  BLOOD_TYPES = %w[A- A+ B- B+ AB- AB+ O- O+].freeze

  belongs_to :user
  has_many :donations, foreign_key: 'donor_id', dependent: :destroy

  validates :blood_type, presence: true
  validates :user_id, uniqueness: true

  enum donor_status: { active: 0, inactive: 1 }
  enum eligibility_status: { eligible: 0, ineligible: 1 }
end
