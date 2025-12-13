class MessagesController < ApplicationController
  def create
    @blood_request = BloodRequest.find(params[:blood_request_id])
    @message = @blood_request.messages.build(message_params)
    @message.user = current_user

    if @message.save
      respond_to do |format|
        format.turbo_stream { render :create }
        format.html { redirect_to blood_request_path(@blood_request) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("message_form", partial: "messages/form") }
        format.html { render "blood_requests/show", status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
