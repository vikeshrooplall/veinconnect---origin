class BloodRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Blood request for donor's blood type
    if current_user.donor?
      @blood_requests = BloodRequest.for_donor
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
    @message = Message.new
    @messages = @blood_request.messages
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

  def accepted_requests
    @blood_requests = BloodRequest.accepted_by(current_user)
  end


  def accept
    @blood_request = BloodRequest.find(params[:id])

    if @blood_request.pending? && current_user.is_donor?
      @blood_request.update(status: :accepted, accepted_by: current_user)
      redirect_to blood_request_path(@blood_request), notice: "You accepted this request."
    else
      redirect_to blood_request_path(@blood_request), alert: "Cannot accept this request."
    end
  end


  # def reject
  #   @blood_request = BloodRequest.find(params[:id])

  #   if @blood_request.pending? && current_user.is_donor?
  #     @blood_request.update(status: :pending)
  #     redirect_to blood_request_path(@blood_request), notice: "You rejected this request."
  #   else
  #     redirect_to blood_request_path(@blood_request), alert: "Cannot reject this request."
  #   end
  # end

  # def complete
  #   @blood_request = BloodRequest.find(params[:id])

  #   if @blood_request.accepted_by?(current_user) || @blood_request.pending?
  #     @blood_request.update(status: :completed)

  #       Notification.create!(
  #         user: @blood_request.user,
  #         notifiable: @blood_request,
  #         blood_request_id: @blood_request.id,
  #         kind: "request_completed",
  #         data: { message: "Your blood request ##{@blood_request.id} has been completed by #{@blood_request.accepted_by&.full_name || 'a donor'}." }
  #       )

  #     redirect_to blood_request_path(@blood_request), notice: "Marked as completed."
  #   else
  #     redirect_to blood_request_path(@blood_request), alert: "Cannot complete this request."
  #   end
  # end

  def complete
    @blood_request = BloodRequest.find(params[:id])

    # Patient who created the request OR donor who accepted it
    if current_user == @blood_request.user || @blood_request.accepted_by == current_user

      @blood_request.update(status: :completed)

      # Notify patient ONLY if donor marked complete
      if current_user.is_donor?
        Notification.create!(
          user: @blood_request.user,
          notifiable: @blood_request,
          blood_request_id: @blood_request.id,
          kind: "request_completed",
          data: {
            message: "Your blood request ##{@blood_request.id} has been marked completed by #{@blood_request.accepted_by.full_name}."
          }
        )
      end

      redirect_to blood_request_path(@blood_request), notice: "Marked as completed."

    else
      redirect_to blood_request_path(@blood_request), alert: "You are not authorized to complete this request."
    end
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
