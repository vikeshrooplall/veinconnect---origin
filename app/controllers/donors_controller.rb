class DonorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @donors = Donor.all
  end
end
