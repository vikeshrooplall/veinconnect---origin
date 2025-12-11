class Facility < ApplicationRecord
  has_many :blood_requests, dependent: :destroy
  has_many :donations, dependent: :destroy
  # has_many :inventories, dependent: :destroy

  validates :name, :address, :phone_number, presence: true
  enum :facility_type, { hospital: 0, clinic: 1, mobile_team: 2, blood_donation_center: 3 }

  geocoded_by :address do |facility, results|
    # check for results from geocoding
    if geo = results.first
      # Assign coordinates from results
      facility.latitude = geo.latitude
      facility.longitude = geo.longitude
      # check whether coordinates are in mauritius
      unless facility.latitude.between?(-20.6, -19.9) && facility.longitude.between?(57.2, 57.9)
        # if not,
        # Retry search again with mauritius in the address
        if retry_results = Geocoder.search("#{facility.address}, Mauritius")
          # check coordinates from retry
          if retry_geo = retry_results.first
            # assign coordinates from retry is coordinates from results are not in mauritius
            facility.latitude = retry_geo.latitude
            facility.longitude = retry_geo.longitude
          end
        end
      end
    end
  end

  after_validation :geocode, if: :will_save_change_to_address?

  validate :coordinates_in_mauritius

  private

  def coordinates_in_mauritius
    return unless latitude.present? && longitude.present?
    # Mauritius Boundaries
    mauritius_lat_min = -20.6
    mauritius_lat_max = -19.9
    mauritius_lng_min = 57.2
    mauritius_lng_max = 57.9

    # check if coordinates are in Mtius
    unless latitude.between?(mauritius_lat_min, mauritius_lat_max) &&
           longitude.between?(mauritius_lng_min, mauritius_lng_max)
      errors.add(:base, "Coordinates must be within Mauritius. Lat: -20.6 to -19.9, Lng: 57.2 to 57.9")
    end
  end
end
