class NotificationsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @blood_request = BloodRequest.find(params[:id])
    @notification = Notification.new(notification_params)
    @notification.blood_request = @blood_request
    if @notification.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:notification, partial: "notifications/notification",
            locals: { notification: @notification })
        end
        format.html { redirect_to blood_request_path(@blood_request) }
      end
    else
      render "blood_request/new", status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:content)
  end
end
