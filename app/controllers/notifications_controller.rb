class NotificationsController < ApplicationController
  def create
    @blood_request = BloodRequest.find(params[:id])
    @notification = Notification.new(notification_params)
    @notification.user = current_user
    @notification.notifiable = @blood_request

    if @notification.save
      respond_to do |format|
        format.html { redirect_to blood_request_path(@blood_request) }
        format.turbo_stream
      end
    else
      render "blood_request/show", status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:kind)
  end
end
