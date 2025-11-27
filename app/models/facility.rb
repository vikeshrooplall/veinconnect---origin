class Facility < ApplicationRecord
  has_many :blood_requests, dependent: :destroy
  has_many :donations, dependent: :destroy
  # has_many :inventories, dependent: :destroy

  validates :name, :address, :phone_number, presence: true
  enum :facility_type, { hospital: 0, clinic: 1, mobile_team: 2 }

  geocoded_by :address
  
  after_validation :geocode, if: :will_save_change_to_address?

end
