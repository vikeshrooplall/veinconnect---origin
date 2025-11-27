class DonorsController < ApplicationController
  before_action :authenticate_user!
  def index
    # @donors = Donor.all # modify
    @donors = Donor.active.all
  end
end
