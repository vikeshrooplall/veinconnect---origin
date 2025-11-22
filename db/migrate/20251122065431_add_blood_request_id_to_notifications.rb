class AddBloodRequestIdToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_reference :notifications, :blood_request, null: false, foreign_key: true
  end
end
