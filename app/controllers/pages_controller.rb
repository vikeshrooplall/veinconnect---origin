class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @donor = current_user.donor if user_signed_in?
    # map to show locations of facilities
    @facilities = Facility.all
    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window_html: render_to_string(partial: "facilities/info_window", locals: { facility: facility }),
        marker_html: render_to_string(partial: "facilities/marker", locals: { facility: facility })
      }
    end
    # urgent Blood requests
    @urgent_requests = BloodRequest.pending.urgent.order(needed_by: :asc)

    # active Blood requests sorted by urgency and date
    @normal_requests = BloodRequest.pending.active.order(urgency: :desc, needed_by: :asc)

    if user_signed_in? && current_user.donor?
      @urgent_requests = BloodRequest.urgent_or_critical.active
      @blood_requests = BloodRequest.for_donor(current_user.blood_type).limit(5)
      @matching_requests = BloodRequest.active.where(blood_type: current_user.blood_type).count
    end
  end

def show

end
end
