class MessagesController < ApplicationController
  def create
    @blood_request = BloodRequest.find(params[:blood_request_id])
    @message = @blood_request.messages.build(message_params)
    @message.user = current_user

    if @message.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to blood_request_path(@blood_request) }
      end
    else
      @messages = @blood_request.messages
      render "blood_request/show", status: :unprocessable_entity
    end
  end

  def update
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
