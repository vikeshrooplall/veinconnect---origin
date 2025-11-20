class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  validates :kind, presence: true

  after_create_commit :broadcast_message

  private

  def broadcast_notification
    broadcast_append_to "blood_request_#{blood_request.id}_notifications",
                        partial: "notifications/notification",
                        target: "notifications",
                        locals: { notification: self }
  end
end
