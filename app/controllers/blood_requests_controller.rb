class BloodRequestsController < ApplicationController
   before_action :authenticate_user!
  def index
    @blood_requests = BloodRequest.all
  end

  def new
    @blood_request = BloodRequest.new
  end

  def create
    @blood_request = BloodRequest.new(params[:BloodRequest])
    @blood_request.save
    redirect_to blood_request_path(@BloodRequest)
  end

  def update
    @blood_request = BloodRequest.find(params[:id])
    @blood_request.update(blood_request_params)
    redirect_to blood_request_path(@blood_request)
  end

  private

  def blood_request_params
    params.require(:blood_request).permit(:first_name, :last_name, :address, :needed_by, :blood_type, :quantity, :facility_name)
  end
end
