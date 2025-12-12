class DonationsController < ApplicationController
  def index
     @donations = current_user.donor&.donations || Donation.none
  end

  def show
    @donation = Donation.find(params[:id])
  end
end
