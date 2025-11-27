class BloodRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Blood request for donor's blood type
    if current_user.donor?
      @blood_requests = BloodRequest.for_donor(current_user.blood_type)
    else
      # patient blood request history
      @blood_requests = current_user.blood_requests.order(created_at: :desc)
    end
  end

  def new
    @blood_request = BloodRequest.new
  end

  def create
    @blood_request = BloodRequest.new(blood_request_params)
    @blood_request.user_id = current_user.id
    @blood_request.status = :pending
    @blood_request.patient_name = "#{current_user.first_name} #{current_user.last_name}"
    @blood_request.patient_phone_number = current_user.phone
    @blood_request.message = "Blood donation request"

    if @blood_request.save
      notify_donors(@blood_request)
      redirect_to blood_request_path(@blood_request), notice: "Blood request created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @blood_request = BloodRequest.find(params[:id])
    @blood_requests = current_user.blood_requests.order(created_at: :desc)
    @notification = Notification.new
  end

  def update
    @blood_request = BloodRequest.find(params[:id])
    if @blood_request.update(blood_request_params)
      redirect_to blood_request_path(@blood_request), notice: "Blood request updated successfully."
    else
      render :show, status: :unprocessable_entity
    end
  end

  def donor_index
    # Special view for donors showing all active requests filtered by their blood type
    @blood_requests = BloodRequest.active
                                  .where(blood_type: current_user.blood_type)
                                  .order(urgency: :desc, needed_by: :asc)
  end

  def urgent_requests
    @blood_requests = BloodRequest.urgent_or_critical.active
                                  .order(urgency: :desc, created_at: :desc)
  end

  private

  def blood_request_params
    params.require(:blood_request).permit(:blood_type, :needed_by, :quantity, :facility_id, :urgency, :message)
  end

  def notify_donors(blood_request)
    donors = User.where(is_donor: true, blood_type: blood_request.blood_type)

    donors.each do |donor|
      Notification.create!(
        user: donor,
        notifiable: blood_request,
        blood_request_id: blood_request.id,
        kind: "new_request",
        data: { message: "New blood request for #{blood_request.blood_type}",
                urgency: blood_request.urgency,
                patient_name: blood_request.patient_name
        }
      )
    end
  end
end
