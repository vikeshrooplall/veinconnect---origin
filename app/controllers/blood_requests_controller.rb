class BloodRequestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @blood_requests = BloodRequest.all
  end

  def new
    @blood_request = BloodRequest.new
  end

  def create
    @blood_request = BloodRequest.new(blood_request_params)
    @blood_request.user = current_user
    # raise
    if @blood_request.save
      notify_donors(@blood_request)
      redirect_to blood_request_path(@bloodRequest)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @blood_request = BloodRequest.find(params[:id])
    @blood_requests = @blood_request.where(user: current_user)
    @notification = Notification.new
  end

  def update
    @blood_request = BloodRequest.find(params[:id])
    @blood_request.update(blood_request_params)
    redirect_to blood_request_path(@blood_request)
  end

  def notify_donors(blood_request)
    donors = User.where(blood_type: blood_request.blood_type)
    donors.each do |donor|
      Notification.create!(
        user: donor,
        body: "Urgent: A patient needs blood type #{blood_request.blood_type}"
      )
    end
  end

  private

  def blood_request_params
    params.require(:blood_request).permit(:first_name, :last_name, :address, :needed_by, :blood_type, :quantity, :facility_id)
  end
end
