class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  validates :kind, presence: true

  after_create_commit :broadcast_notification

  private

  def broadcast_notification
    broadcast_append_to(
      "notifications_#{user_id}",
      partial: "notifications/notification",
      locals:  { notification: self },
      target: "notifications"
    )
  end
end
